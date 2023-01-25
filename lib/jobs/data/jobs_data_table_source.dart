import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibmq/jobs/cubit/jobs_cache_cubit.dart';
import 'package:ibmq/jobs/cursor/bloc/cursors_bloc.dart';
import 'package:ibmq/jobs/cursor/model/paging_cursor.dart';
import 'package:ibmq/jobs/data/runtime_jobs_data_provider.dart';
import 'package:ibmq/jobs/model/runtime_job.dart';
import 'package:ibmq/jobs/model/runtime_job_metrics.dart';
import 'package:ibmq/router.dart';
import 'package:intl/intl.dart';

import '../model/job.dart';
import 'jobs_data_provider.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final Dio dio;
  final Dio runtimeDio;
  final IBMQAppState appState;
  final CursorsBloc bloc;
  final JobsCacheCubit jobsCacheCubit;

  JobsDataTableSource({
    required this.dio,
    required this.runtimeDio,
    required this.appState,
    required this.bloc,
    required this.jobsCacheCubit,
  });
  // `start` is the number of rows to be skipped
  // `end` is the number of rows to be fetched i.e. limit
  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    // Get cached jobs
    final cachedJobs = jobsCacheCubit.state as JobsCacheLoaded;
    // Initialize data providers
    final jobsDataProvider = JobsDataProvider(dio);
    final runtimeJobsDataProvider = RuntimeJobsDataProvider(runtimeDio);
    // Get cursors
    final cursors = bloc.state as CursorsLoaded;
    int noOfJobs = cursors.cursor.total;
    int noOfRuntimeJobs = cursors.runtimeCursor.total;
    List<BaseJob> displayJobs = [];
    if (start < cachedJobs.jobs.length) {
      displayJobs = cachedJobs.jobs.sublist(start, start + end);
    } else {
      // Fetch data only if jobs in cursors are less than `end`
      bool shouldFetchJobs = cursors.cursor.jobs.length < end &&
          cursors.cursor.skip + cursors.cursor.jobs.length <=
              cursors.cursor.total;
      bool shouldFetchRuntimeJobs = cursors.runtimeCursor.jobs.length < end &&
          cursors.runtimeCursor.skip + cursors.runtimeCursor.jobs.length <=
              cursors.runtimeCursor.total;
      List<BaseJob> allJobs = [];
      if (shouldFetchJobs && shouldFetchRuntimeJobs) {
        // Fetch data
        final responses = await Future.wait([
          jobsDataProvider.getJobs(
              cursors.cursor.skip, end - cursors.cursor.jobs.length),
          runtimeJobsDataProvider.getJobs(cursors.runtimeCursor.skip,
              end - cursors.runtimeCursor.jobs.length),
        ]);
        // Parse data
        // Using `compute` to parse data in a separate isolate
        final jobs = await Future.wait([
          compute(_parseJobs, responses[0].data['items'] as List),
          compute(_parseRuntimeJobs, responses[1].data['jobs'] as List),
        ]);
        // Calculate total rows
        noOfJobs = responses[0].data['meta']['count'] as int;
        noOfRuntimeJobs = responses[1].data['count'] as int;
        // Merge data
        allJobs = [
          ...cursors.cursor.jobs,
          ...cursors.runtimeCursor.jobs,
          ...jobs[0],
          ...jobs[1]
        ];
      } else if (shouldFetchJobs && !shouldFetchRuntimeJobs) {
        // Fetch data
        final response = await jobsDataProvider.getJobs(
          cursors.cursor.skip,
          end - cursors.cursor.jobs.length,
        );
        // Parse data
        // Using `compute` to parse data in a separate isolate
        final jobs = await compute(_parseJobs, response.data['items'] as List);
        // Calculate total rows
        noOfJobs = response.data['meta']['count'] as int;
        // Merge data
        allJobs = [
          ...cursors.cursor.jobs,
          ...cursors.runtimeCursor.jobs,
          ...jobs,
        ];
      } else if (!shouldFetchJobs && shouldFetchRuntimeJobs) {
        // Fetch data
        final response = await runtimeJobsDataProvider.getJobs(
          cursors.runtimeCursor.skip,
          end - cursors.runtimeCursor.jobs.length,
        );
        // Parse data
        // Using `compute` to parse data in a separate isolate
        final jobs = await compute(
          _parseRuntimeJobs,
          response.data['jobs'] as List,
        );
        // Update total rows
        noOfRuntimeJobs = response.data['count'] as int;
        // Merge data
        allJobs = [
          ...cursors.cursor.jobs,
          ...cursors.runtimeCursor.jobs,
          ...jobs,
        ];
      } else {
        // Merge data
        allJobs = [
          ...cursors.cursor.jobs,
          ...cursors.runtimeCursor.jobs,
        ];
      }
      // Sort data
      allJobs.sort((a, b) {
        if (a is Job && b is Job) {
          return b.creationDate.compareTo(a.creationDate);
        } else if (a is RuntimeJob && b is RuntimeJob) {
          return b.created.compareTo(a.created);
        } else if (a is Job && b is RuntimeJob) {
          return b.created.compareTo(a.creationDate);
        } else if (a is RuntimeJob && b is Job) {
          return b.creationDate.compareTo(a.created);
        } else {
          return 0;
        }
      });
      displayJobs = allJobs.take(end).toList();
      final remainingJobs = allJobs.skip(end).toList();
      // Split remaining jobs based on type
      final normalJobs = remainingJobs.whereType<Job>().toList();
      final runtimeJobs = remainingJobs.whereType<RuntimeJob>().toList();
      // Create new cursors
      PagingCursor<Job> cursor;
      PagingCursor<RuntimeJob> runtimeCursor;
      if (shouldFetchJobs) {
        cursor = PagingCursor<Job>(
          skip: cursors.cursor.skip + end - cursors.cursor.jobs.length,
          jobs: normalJobs,
          total: noOfJobs,
        );
      } else {
        cursor = PagingCursor<Job>(
          skip: cursors.cursor.skip,
          jobs: normalJobs,
          total: noOfJobs,
        );
      }
      if (shouldFetchRuntimeJobs) {
        runtimeCursor = PagingCursor<RuntimeJob>(
          skip: cursors.runtimeCursor.skip +
              end -
              cursors.runtimeCursor.jobs.length,
          jobs: runtimeJobs,
          total: noOfRuntimeJobs,
        );
      } else {
        runtimeCursor = PagingCursor<RuntimeJob>(
          skip: cursors.runtimeCursor.skip,
          jobs: runtimeJobs,
          total: noOfRuntimeJobs,
        );
      }
      // Update cursors
      bloc.add(UpdateCursors(cursor: cursor, runtimeCursor: runtimeCursor));
      // Add dis play jobs to cache
      jobsCacheCubit.addJobs(displayJobs);
    }
    final totalRows = noOfJobs + noOfRuntimeJobs;
    // Filter Runtime Jobs in displayJobs
    final filteredDisplayJobs = displayJobs.whereType<RuntimeJob>().toList();
    // Get Job Metrics
    final metricsResponse = await Future.wait(
      filteredDisplayJobs.map(
        (e) => runtimeJobsDataProvider.getJobMetrics(e.id),
      ),
    );
    // Parse Job Metrics
    final metrics = await compute(
      _parseRuntimeJobMetrics,
      metricsResponse.map((e) => e.data).toList(),
    );
    final rows = displayJobs.map(
      (e) {
        if (e is Job) {
          return DataRow2(
            cells: [
              DataCell(
                Text(e.id),
                onLongPress: () async =>
                    await Clipboard.setData(ClipboardData(text: e.id)),
              ),
              DataCell(Text(e.status.name)),
              DataCell(Text(DateFormat.yMd().format(e.creationDate))),
              DataCell(
                Text(e.endDate != null
                    ? DateFormat.yMd().format(e.endDate!)
                    : "Running"),
              ),
              const DataCell(Text("circuit-runner")),
              DataCell(Text(e.backend.name)),
              DataCell(Text(e.provider.toString())),
              DataCell(Text(e.tags.toString())),
            ],
            key: ValueKey(e.id),
            onTap: () => appState.jobId = e.id,
          );
        } else {
          final ee = e as RuntimeJob;
          final metric = metrics[filteredDisplayJobs.indexOf(ee)];
          return DataRow2(
            cells: [
              DataCell(
                Text(ee.id),
                onLongPress: () async =>
                    await Clipboard.setData(ClipboardData(text: ee.id)),
              ),
              DataCell(Text(ee.status.name)),
              DataCell(Text(DateFormat.yMd().format(ee.created))),
              DataCell(
                Text(metric.timestamps.finished != null
                    ? DateFormat.yMd().format(metric.timestamps.finished!)
                    : "Running"),
              ),
              DataCell(Text(ee.program)),
              DataCell(Text(ee.backend ?? "Unknown")),
              DataCell(Text("${ee.hub}/${ee.group}/${ee.project}")),
              DataCell(Text(ee.tags.toString())),
            ],
            key: ValueKey(ee.id),
            onTap: () => appState.jobId = ee.id,
          );
        }
      },
    ).toList();
    return AsyncRowsResponse(totalRows, rows);
  }

  static List<Job> _parseJobs(List<dynamic> items) {
    return items.map((e) => Job.fromJson(e)).toList();
  }

  static List<RuntimeJob> _parseRuntimeJobs(List<dynamic> items) {
    return items.map((e) => RuntimeJob.fromJson(e)).toList();
  }

  static List<RuntimeJobMetrics> _parseRuntimeJobMetrics(List<dynamic> items) {
    return items.map((e) => RuntimeJobMetrics.fromJson(e)).toList();
  }
}
