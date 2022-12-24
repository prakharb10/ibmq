import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/job.dart';
import 'jobs_data_provider.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final Dio dio;

  JobsDataTableSource(this.dio);
  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    final jobsDataProvider = JobsDataProvider(dio);
    final response = await jobsDataProvider.getJobs(end - start, start);
    final totalRows = response.data['meta']['count'] as int;
    final items = response.data['items'] as List;
    // TODO: Compute this in a separate isolate
    final jobs = items.map((e) => Job.fromJson(e)).toList();
    final rows = jobs
        .map(
          (e) => DataRow2.byIndex(
            cells: [
              DataCell(Text(e.id)),
              DataCell(Text(e.status.name)),
              DataCell(Text(e.creationDate.toString())),
              DataCell(Text(e.endDate.toString())),
              DataCell(Text(e.backend.name)),
              DataCell(Text(e.provider.toString())),
              DataCell(Text(e.tags.toString())),
            ],
            index: jobs.indexOf(e),
          ),
        )
        .toList();
    return AsyncRowsResponse(totalRows, rows);
  }
}
