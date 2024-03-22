import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/bloc/jobs_filter.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:intl/intl.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final JobsRepository _jobsRepository;
  JobsFilter _filter = JobsFilter();

  JobsDataTableSource(
      {required JobsFilterBloc jobsFilterBloc,
      required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository {
    jobsFilterBloc.stream.listen((event) {
      talker.debug('JobsDataTableSource: JobsFilterBloc event: $event');
      switch (event) {
        case Initial():
          break;
        case Filtered(:final filter):
          _filter = filter;
          refreshDatasource();
          break;
      }
    });
  }

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async =>
      await _jobsRepository
          .listUserJobs(
            provider: _filter.provider,
            pending: _filter.pending,
            backend: _filter.backend,
            sort: _filter.sort,
            limit: Option.of(count),
            offset: Option.of(startIndex),
            createdAfter: _filter.createdAfter.map((t) => t.toIso8601String()),
            createdBefore:
                _filter.createdBefore.map((t) => t.toIso8601String()),
            tags: _filter.tags,
            program: _filter.program,
            sessionId: _filter.sessionId,
            search: _filter.search,
          )
          .map(
            (r) => AsyncRowsResponse(
              r.count,
              r.jobs
                  .map(
                    (a) => DataRow2(
                      cells: [
                        DataCell(Text(a.id)),
                        DataCell(
                          Text(switch (a.sessionId) {
                            None() => '',
                            Some(:final value) => value,
                          }),
                        ),
                        DataCell(Text(a.status.name)),
                        DataCell(
                          Text(DateFormat.yMd()
                              .add_jm()
                              .format(a.created.toLocal())),
                        ),
                        DataCell(
                          Text(switch (a.endTime) {
                            None() => '',
                            Some(:final value) =>
                              DateFormat.yMd().add_jm().format(value.toLocal()),
                          }),
                        ),
                        DataCell(Text(a.program.id)),
                        DataCell(Text(a.backend)),
                        const DataCell(
                          Text("Usage"),
                        ),
                        DataCell(
                          Text(a.tags.join(', ')),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
          .getOrElse((l) => AsyncRowsResponse(0, []))
          .run();
}
