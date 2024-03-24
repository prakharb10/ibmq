import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/bloc/jobs_filter.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/model/job_status.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:macos_ui/macos_ui.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final JobsRepository _jobsRepository;
  final JobsFilterBloc _jobsFilterBloc;
  JobsFilter _filter = JobsFilter();

  JobsDataTableSource(
      {required JobsFilterBloc jobsFilterBloc,
      required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository,
        _jobsFilterBloc = jobsFilterBloc {
    // TODO: Maybe remove this and add a listener in the UI on the paginator
    _jobsFilterBloc.stream.listen((event) {
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
                      color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return MacosColors.selectedTextBackgroundColor;
                          }
                          return switch (a.status) {
                            JobStatus.failed ||
                            JobStatus.Failed ||
                            JobStatus.errorCreatingJob ||
                            JobStatus.errorTranspilingJob ||
                            JobStatus.errorValidatingJob ||
                            JobStatus.errorRunningJob =>
                              MacosColors.systemRedColor.withOpacity(0.2),
                            JobStatus.completed ||
                            JobStatus.Completed =>
                              MacosColors.systemGreenColor.withOpacity(0.2),
                            JobStatus.queued ||
                            JobStatus.Queued =>
                              MacosColors.systemYellowColor.withOpacity(0.2),
                            JobStatus.cancelled ||
                            JobStatus.Cancelled ||
                            JobStatus.cancelledRanTooLong =>
                              MacosColors.systemGrayColor.withOpacity(0.2),
                            _ => null,
                          };
                        },
                      ),
                      cells: [
                        DataCell(
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth - 40,
                                    child: Text(
                                      a.id,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => Clipboard.setData(
                                        ClipboardData(text: a.id)),
                                    icon: const MacosIcon(
                                        CupertinoIcons.square_on_square),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        DataCell(
                          switch (a.sessionId) {
                            None() => const Text(''),
                            Some(:final value) => switch (value.isEmpty) {
                                true => const Text(''),
                                false => LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: constraints.maxWidth - 40,
                                            child: Text(
                                              value,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () => Clipboard.setData(
                                                ClipboardData(text: value)),
                                            icon: const MacosIcon(CupertinoIcons
                                                .square_on_square),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                              },
                          },
                          onTap: switch (a.sessionId) {
                            None() => null,
                            Some(:final value) => switch (value.isEmpty) {
                                true => null,
                                false => () => _jobsFilterBloc.add(
                                      JobsFilterEvent.sessionIdChanged(
                                        sessionId: value,
                                      ),
                                    ),
                              }
                          },
                        ),
                        DataCell(
                          switch (a.state.reason.isEmpty) {
                            true => Text(a.status.name),
                            false => Tooltip(
                                message: a.state.reason,
                                child: Text(
                                  a.status.name,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                          },
                        ),
                        DataCell(
                          Text(timeAgo(a.created.toLocal())),
                        ),
                        DataCell(
                          Text(switch (a.endTime) {
                            None() => '',
                            Some(:final value) => timeAgo(value.toLocal()),
                          }),
                        ),
                        DataCell(Text(a.program.id)),
                        // TODO: Navigate to backend details
                        DataCell(Text(a.backend)),
                        const DataCell(
                          Text("Usage"),
                        ),
                        DataCell(
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: a.tags
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ActionChip(
                                      label: Text(e),
                                      onPressed: () => _jobsFilterBloc.add(
                                        JobsFilterEvent.tagAdded(tag: e),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
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

String timeAgo(DateTime date) {
  final Duration difference = DateTime.now().difference(date);

  if (difference.inSeconds < 60) {
    return 'a moment ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()} months ago';
  } else {
    return '${(difference.inDays / 365).floor()} years ago';
  }
}
