import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/jobs/bloc/jobs_filter.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/data/jobs_data_table_source.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/runtime_job/runtime_job_repository.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class JobsDataTable extends StatefulWidget {
  const JobsDataTable({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  State<JobsDataTable> createState() => _JobsDataTableState();
}

class _JobsDataTableState extends State<JobsDataTable> {
  final PaginatorController _paginatorController = PaginatorController();
  late final JobsDataTableSource _jobsDataTableSource;

  @override
  void initState() {
    super.initState();
    _jobsDataTableSource = JobsDataTableSource(
      jobsFilterBloc: context.read<JobsFilterBloc>(),
      jobsRepository: context.read<JobsRepository>(),
      runtimeJobRepository: context.read<RuntimeJobRepository>(),
      context: context,
      filter: switch (context.read<JobsFilterBloc>().state) {
        Filtered(:final filter) => filter,
        _ => JobsFilter(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsFilterBloc, JobsFilterState>(
      listener: (context, state) => _paginatorController.goToFirstPage(),
      builder: (context, state) => switch (state) {
        Filtered(:final filter) =>
          BlocListener<NotificationsBloc, NotificationsState>(
            listener: (context, state) {
              switch (state) {
                case Loaded():
                  switch (_paginatorController.currentRowIndex) {
                    case 0:
                      _jobsDataTableSource.refreshDatasource();
                      break;
                    default:
                      break;
                  }
                  break;
                default:
                  break;
              }
            },
            listenWhen: (previous, current) => current is Loaded,
            child: AsyncPaginatedDataTable2(
              wrapInCard: false,
              controller: _paginatorController,
              scrollController: widget.scrollController,
              headingTextStyle: switch (Theme.of(context).platform) {
                TargetPlatform.macOS => MacosTheme.of(context)
                    .typography
                    .title3
                    .copyWith(color: MacosTheme.of(context).primaryColor),
                TargetPlatform.windows =>
                  fluent.FluentTheme.of(context).typography.bodyLarge,
                _ => Theme.of(context).textTheme.headlineMedium,
              },
              sortArrowIcon: switch (Theme.of(context).platform) {
                TargetPlatform.macOS ||
                TargetPlatform.iOS =>
                  CupertinoIcons.chevron_up,
                TargetPlatform.linux => YaruIcons.pan_up,
                TargetPlatform.windows => FluentIcons.arrow_up_24_regular,
                _ => Icons.arrow_upward,
              },
              header: const Text("Jobs"),
              actions: [
                switch (filter.tags) {
                  Some(:final value) => switch (Theme.of(context).platform) {
                      TargetPlatform.linux => YaruChoiceChipBar(
                          labels: value.map((e) => Text(e)).toList(),
                          yaruChoiceChipBarStyle: YaruChoiceChipBarStyle.wrap,
                          isSelected: value.map((e) => true).toList(),
                          onSelected: (index) => context
                              .read<JobsFilterBloc>()
                              .add(
                                JobsFilterEvent.tagRemoved(tag: value[index]),
                              ),
                          clearOnSelect: false,
                        ),
                      _ => Wrap(
                          spacing: 8.0,
                          children: value
                              .map(
                                (tag) => InputChip(
                                  label: Text(tag),
                                  tooltip: "Tag",
                                  onDeleted: () => context
                                      .read<JobsFilterBloc>()
                                      .add(
                                        JobsFilterEvent.tagRemoved(tag: tag),
                                      ),
                                ),
                              )
                              .toList()),
                    },
                  None() => const SizedBox.shrink(),
                },
                switch (filter.sessionId) {
                  Some(:final value) => InputChip(
                      label: Text(value),
                      tooltip: "Session Id",
                      onDeleted: () => context.read<JobsFilterBloc>().add(
                            const JobsFilterEvent.sessionIdChanged(
                              sessionId: null,
                            ),
                          ),
                    ),
                  None() => const SizedBox.shrink(),
                },
                Tooltip(
                  message: "Refresh Jobs",
                  child: IconButton(
                    icon: switch (Theme.of(context).platform) {
                      TargetPlatform.macOS =>
                        const MacosIcon(CupertinoIcons.refresh),
                      TargetPlatform.linux => const Icon(YaruIcons.refresh),
                      TargetPlatform.windows =>
                        const Icon(FluentIcons.arrow_clockwise_24_filled),
                      _ => const Icon(Icons.refresh),
                    },
                    onPressed: () => _jobsDataTableSource.refreshDatasource(),
                  ),
                ),
              ],
              columns: [
                DataColumn2(
                  label: Text(
                    "Job Id",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(
                    "Session Id",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(
                    "Status",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Created",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                  onSort: (columnIndex, ascending) =>
                      context.read<JobsFilterBloc>().add(
                            JobsFilterEvent.sortChanged(
                                sort: ascending ? 'ASC' : 'DESC'),
                          ),
                ),
                DataColumn2(
                  label: Text(
                    "Completed",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                ),
                DataColumn2(
                  label: Text(
                    "Program",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                ),
                DataColumn2(
                  label: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "Compute Resource",
                      style: switch (Theme.of(context).platform) {
                        TargetPlatform.linux =>
                          Theme.of(context).textTheme.titleLarge,
                        _ => null,
                      },
                    ),
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text(
                    "Usage",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Text(
                    "Tags",
                    style: switch (Theme.of(context).platform) {
                      TargetPlatform.linux =>
                        Theme.of(context).textTheme.titleLarge,
                      _ => null,
                    },
                  ),
                ),
              ],
              source: _jobsDataTableSource,
              fixedLeftColumns: 1,
              lmRatio: 1.5,
              minWidth: 1500,
              sortColumnIndex: 3,
              sortAscending: switch (filter.sort) {
                Some(:final value) => value == 'ASC',
                None() => false,
              },
              showFirstLastButtons: true,
              columnSpacing: 40,
              renderEmptyRowsInTheEnd: false,
              loading: Center(
                child: switch (Theme.of(context).platform) {
                  TargetPlatform.macOS => const ProgressCircle(),
                  TargetPlatform.linux => const YaruCircularProgressIndicator(),
                  TargetPlatform.windows => const fluent.ProgressRing(),
                  _ => const CircularProgressIndicator.adaptive(),
                },
              ),
              empty: const Center(
                child: Text("No Jobs Found"),
              ),
              onRowsPerPageChanged: (value) =>
                  _jobsDataTableSource.refreshDatasource(),
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
