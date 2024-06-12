import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/bloc/jobs_filter.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/model/job.dart';
import 'package:ibmq/jobs/model/job_status.dart';
import 'package:ibmq/jobs/job/runtime/metrics/cubit/runtime_job_metrics_cubit.dart';
import 'package:ibmq/jobs/job/runtime/runtime_job_repository.dart';
import 'package:ibmq/router.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:yaru/yaru.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final JobsRepository _jobsRepository;
  final RuntimeJobRepository _runtimeJobRepository;
  final JobsFilterBloc _jobsFilterBloc;
  final BuildContext _context;
  JobsFilter _filter;

  JobsDataTableSource({
    required JobsFilterBloc jobsFilterBloc,
    required JobsRepository jobsRepository,
    required RuntimeJobRepository runtimeJobRepository,
    required BuildContext context,
    required JobsFilter filter,
  })  : _jobsRepository = jobsRepository,
        _runtimeJobRepository = runtimeJobRepository,
        _context = context,
        _filter = filter,
        _jobsFilterBloc = jobsFilterBloc {
    _jobsFilterBloc.stream.listen((event) {
      switch (event) {
        case Initial():
          break;
        case Filtered(:final filter):
          _filter = filter;
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
                      onTap: () => switch (a.type) {
                        JobType.iqx => IQXJobRoute(jobId: a.id).go(_context),
                        JobType.runtime =>
                          RuntimeJobRoute(jobId: a.id).go(_context),
                      },
                      color: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return switch (Theme.of(_context).platform) {
                              TargetPlatform.macOS =>
                                MacosColors.selectedTextBackgroundColor,
                              TargetPlatform.linux =>
                                YaruColors.of(_context).link.withOpacity(0.2),
                              TargetPlatform.windows =>
                                fluent.FluentTheme.of(_context)
                                    .accentColor
                                    .withOpacity(0.2),
                              _ => Theme.of(_context).colorScheme.surfaceTint,
                            };
                          }
                          return switch (a.status) {
                            JobStatus.failed ||
                            JobStatus.Failed ||
                            JobStatus.errorCreatingJob ||
                            JobStatus.errorTranspilingJob ||
                            JobStatus.errorValidatingJob ||
                            JobStatus.errorRunningJob =>
                              switch (Theme.of(_context).platform) {
                                TargetPlatform.macOS =>
                                  MacosColors.systemRedColor.withOpacity(0.2),
                                TargetPlatform.linux => YaruColors.of(_context)
                                    .error
                                    .withOpacity(0.2),
                                TargetPlatform.windows =>
                                  fluent.Colors.errorSecondaryColor,
                                _ => Theme.of(_context)
                                    .colorScheme
                                    .error
                                    .withOpacity(0.2),
                              },
                            JobStatus.completed ||
                            JobStatus.Completed =>
                              switch (Theme.of(_context).platform) {
                                TargetPlatform.macOS =>
                                  MacosColors.systemGreenColor.withOpacity(0.2),
                                TargetPlatform.linux => YaruColors.of(_context)
                                    .success
                                    .withOpacity(0.2),
                                TargetPlatform.windows =>
                                  fluent.Colors.successSecondaryColor,
                                _ => Theme.of(_context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                              },
                            JobStatus.queued || JobStatus.Queued => switch (
                                  Theme.of(_context).platform) {
                                TargetPlatform.macOS => MacosColors
                                    .systemYellowColor
                                    .withOpacity(0.2),
                                TargetPlatform.linux => YaruColors.of(_context)
                                    .warning
                                    .withOpacity(0.2),
                                TargetPlatform.windows =>
                                  fluent.Colors.warningSecondaryColor,
                                _ => Theme.of(_context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.2),
                              },
                            JobStatus.cancelled ||
                            JobStatus.Cancelled ||
                            JobStatus.cancelledRanTooLong =>
                              switch (Theme.of(_context).platform) {
                                TargetPlatform.macOS =>
                                  MacosColors.systemGrayColor.withOpacity(0.2),
                                TargetPlatform.linux =>
                                  YaruColors.purple.withOpacity(0.2),
                                TargetPlatform.windows =>
                                  fluent.Colors.grey[110],
                                _ => Theme.of(_context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.2),
                              },
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
                                    icon: switch (Theme.of(_context).platform) {
                                      TargetPlatform.macOS => const MacosIcon(
                                          CupertinoIcons.square_on_square,
                                        ),
                                      TargetPlatform.windows => const Icon(
                                          FluentIcons.copy_24_regular,
                                        ),
                                      _ => const Icon(Icons.copy),
                                    },
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
                                            icon: switch (
                                                Theme.of(_context).platform) {
                                              TargetPlatform.macOS =>
                                                const MacosIcon(
                                                  CupertinoIcons
                                                      .square_on_square,
                                                ),
                                              TargetPlatform.windows =>
                                                const Icon(
                                                  FluentIcons.copy_24_regular,
                                                ),
                                              _ => const Icon(Icons.copy),
                                            },
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
                          Timeago(
                            builder: (context, value) => Text(value),
                            date: a.created.toLocal(),
                          ),
                        ),
                        DataCell(
                          switch (a.endTime) {
                            None() => const Text(''),
                            Some(:final value) => Timeago(
                                builder: (context, value) => Text(value),
                                date: value.toLocal(),
                              ),
                          },
                        ),
                        DataCell(Text(a.program.id)),
                        // TODO: Navigate to backend details
                        DataCell(Text(a.backend)),
                        DataCell(
                          switch (a.status) {
                            JobStatus.queued ||
                            JobStatus.Queued ||
                            JobStatus.running ||
                            JobStatus.Running =>
                              Text(switch (a.estimatedRunningTimeSeconds) {
                                None() => '',
                                Some(:final value) => '${value.toInt()}s',
                              }),
                            JobStatus.completed ||
                            JobStatus.Completed ||
                            JobStatus.failed ||
                            JobStatus.Failed ||
                            JobStatus.errorCreatingJob ||
                            JobStatus.errorTranspilingJob ||
                            JobStatus.errorValidatingJob ||
                            JobStatus.errorRunningJob ||
                            JobStatus.cancelled ||
                            JobStatus.Cancelled ||
                            JobStatus.cancelledRanTooLong =>
                              switch (a.type) {
                                JobType.iqx => const Text(''),
                                JobType.runtime => BlocBuilder<
                                      RuntimeJobMetricsCubit,
                                      RuntimeJobMetricsState>(
                                    bloc: RuntimeJobMetricsCubit(
                                      runtimeJobRepository:
                                          _runtimeJobRepository,
                                    )..loadMetrics(a.id),
                                    builder: (context, state) =>
                                        switch (state) {
                                      LoadInProgress() =>
                                        const LinearProgressIndicator(),
                                      LoadFailure(:final error) => Tooltip(
                                          message: error,
                                          child: switch (
                                              Theme.of(_context).platform) {
                                            TargetPlatform.macOS =>
                                              const MacosIcon(
                                                CupertinoIcons
                                                    .exclamationmark_triangle,
                                                color:
                                                    MacosColors.systemRedColor,
                                              ),
                                            _ => const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              ),
                                          },
                                        ),
                                      LoadSuccess(:final metrics) =>
                                        Text(switch (metrics.usage) {
                                          None() => '',
                                          Some(:final value) =>
                                            '${value.seconds}s',
                                        }),
                                      _ => const Text(''),
                                    },
                                  )
                              },
                            _ => const Text(''),
                          },
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
