import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/instances/cubit/instances_cubit.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/data/jobs_data_table_source.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/runtime_job/runtime_job_repository.dart';
import 'package:ibmq/user/cubit/user_cubit.dart';
import 'package:ibmq/utils/version/cubit/version_cubit.dart';
import 'package:macos_ui/macos_ui.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  late final JobsDataTableSource _jobsDataTableSource;
  final PaginatorController _paginatorController = PaginatorController();

  @override
  void initState() {
    super.initState();
    context.read<InstancesCubit>().loadInstances();
    _jobsDataTableSource = JobsDataTableSource(
      jobsFilterBloc: context.read<JobsFilterBloc>(),
      jobsRepository: context.read<JobsRepository>(),
      runtimeJobRepository: context.read<RuntimeJobRepository>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosScaffold(
          toolBar: ToolBar(
            enableBlur: true,
            leading: MacosTooltip(
              message: 'Toggle Sidebar',
              useMousePosition: false,
              child: MacosIconButton(
                icon: MacosIcon(
                  CupertinoIcons.sidebar_left,
                  color: MacosTheme.brightnessOf(context).resolve(
                    const Color.fromRGBO(0, 0, 0, 0.5),
                    const Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                  size: 20.0,
                ),
                boxConstraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                  maxWidth: 48,
                  maxHeight: 38,
                ),
                onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
              ),
            ),
            actions: [
              CustomToolbarItem(
                tooltipMessage: "Current Instance",
                inToolbarBuilder: (context) =>
                    BlocConsumer<InstancesCubit, InstancesState>(
                  listener: (context, state) {
                    switch (state) {
                      case InstancesLoadSuccess(instances: final instances):
                        context
                            .read<InstanceFilterCubit>()
                            .changeInstance(instances.first.name);
                        // The first event on the InstanceFilterCubit is not
                        // triggering the listener, so we need to manually
                        // trigger the JobsFilterBloc event.
                        context.read<JobsFilterBloc>().add(
                              JobsFilterEvent.providerChanged(
                                  provider: instances.first.name),
                            );
                        break;
                      default:
                        break;
                    }
                  },
                  builder: (context, state) => switch (state) {
                    InstancesLoadSuccess(instances: var instances) =>
                      BlocConsumer<InstanceFilterCubit, Option<String>>(
                        listener: (context, state) {
                          switch (state) {
                            case Some(:final value):
                              context.read<JobsFilterBloc>().add(
                                    JobsFilterEvent.providerChanged(
                                        provider: value),
                                  );

                              break;
                            case None():
                              break;
                          }
                        },
                        builder: (context, state) {
                          return MacosPopupButton<String>(
                            value: state.toNullable(),
                            hint: const Text("Select Instance"),
                            items: instances
                                .map(
                                  (e) => MacosPopupMenuItem(
                                    value: e.name,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => context
                                .read<InstanceFilterCubit>()
                                .changeInstance(value),
                          );
                        },
                      ),
                    InstancesLoadInProgress() => const MacosTooltip(
                        message: "Loading Instances",
                        child: ProgressCircle(),
                      ),
                    _ => const SizedBox.shrink(),
                  },
                ),
              )
            ],
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) =>
                  BlocBuilder<InstancesCubit, InstancesState>(
                builder: (context, state) => switch (state) {
                  InstancesLoadSuccess() =>
                    BlocConsumer<JobsFilterBloc, JobsFilterState>(
                      listener: (context, state) =>
                          _paginatorController.goToFirstPage(),
                      builder: (context, state) => switch (state) {
                        Filtered(:final filter) => Theme(
                            data: ThemeData(
                              brightness: MacosTheme.brightnessOf(context),
                              colorSchemeSeed:
                                  MacosTheme.of(context).primaryColor,
                              canvasColor: MacosTheme.of(context).canvasColor,
                              iconTheme: IconThemeData(
                                color: MacosTheme.of(context).iconTheme.color,
                                opacity:
                                    MacosTheme.of(context).iconTheme.opacity,
                                size: MacosTheme.of(context).iconTheme.size,
                              ),
                            ),
                            child: Material(
                              child: AsyncPaginatedDataTable2(
                                wrapInCard: false,
                                controller: _paginatorController,
                                scrollController: scrollController,
                                headingTextStyle: MacosTheme.of(context)
                                    .typography
                                    .title3
                                    .copyWith(
                                        color: MacosTheme.of(context)
                                            .primaryColor),
                                sortArrowIcon: CupertinoIcons.chevron_up,
                                header: const Text("Jobs"),
                                actions: [
                                  switch (filter.tags) {
                                    Some(:final value) => Wrap(
                                        spacing: 8.0,
                                        children: value
                                            .map(
                                              (tag) => InputChip(
                                                label: Text(tag),
                                                tooltip: "Tag",
                                                onDeleted: () => context
                                                    .read<JobsFilterBloc>()
                                                    .add(
                                                      JobsFilterEvent
                                                          .tagRemoved(tag: tag),
                                                    ),
                                              ),
                                            )
                                            .toList()),
                                    None() => const SizedBox.shrink(),
                                  },
                                  switch (filter.sessionId) {
                                    Some(:final value) => InputChip(
                                        label: Text(value),
                                        tooltip: "Session Id",
                                        onDeleted: () =>
                                            context.read<JobsFilterBloc>().add(
                                                  const JobsFilterEvent
                                                      .sessionIdChanged(
                                                    sessionId: null,
                                                  ),
                                                ),
                                      ),
                                    None() => const SizedBox.shrink(),
                                  },
                                  MacosTooltip(
                                    message: "Refresh Jobs",
                                    child: IconButton(
                                      icon: const MacosIcon(
                                          CupertinoIcons.arrow_clockwise),
                                      onPressed: () => _jobsDataTableSource
                                          .refreshDatasource(),
                                    ),
                                  ),
                                ],
                                columns: [
                                  const DataColumn2(
                                    label: Text("Job Id"),
                                    size: ColumnSize.L,
                                  ),
                                  const DataColumn2(
                                    label: Text("Session Id"),
                                    size: ColumnSize.L,
                                  ),
                                  const DataColumn2(label: Text("Status")),
                                  DataColumn2(
                                    label: const Text("Created"),
                                    onSort: (columnIndex, ascending) => context
                                        .read<JobsFilterBloc>()
                                        .add(
                                          JobsFilterEvent.sortChanged(
                                              sort: ascending ? 'ASC' : 'DESC'),
                                        ),
                                  ),
                                  const DataColumn2(label: Text("Completed")),
                                  const DataColumn2(label: Text("Program")),
                                  const DataColumn2(
                                    label: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text("Compute Resource"),
                                    ),
                                    size: ColumnSize.L,
                                  ),
                                  const DataColumn2(
                                    label: Text("Usage"),
                                    size: ColumnSize.S,
                                  ),
                                  const DataColumn2(label: Text("Tags")),
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
                                loading: const Center(
                                  child: MacosTooltip(
                                    message: "Loading Instances",
                                    child: ProgressCircle(),
                                  ),
                                ),
                                empty: const Center(
                                  child: Text("No Jobs Found"),
                                ),
                                onRowsPerPageChanged: (value) =>
                                    _jobsDataTableSource.refreshDatasource(),
                              ),
                            ),
                          ),
                        _ => const SizedBox.shrink(),
                      },
                    ),
                  InstancesLoadInProgress() => const Center(
                      child: MacosTooltip(
                        message: "Loading Instances",
                        child: ProgressCircle(),
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
            )
          ],
        ),
      TargetPlatform.iOS => CupertinoTabView(
          defaultTitle: 'Jobs',
          builder: (context) => CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  middle: const Text("IBM Quantum Dashboard"),
                  trailing: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return switch (state) {
                        UserInfoLoadSuccess(user: var user) => GestureDetector(
                            child: const Icon(CupertinoIcons.profile_circled),
                            onTap: () => showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Column(
                                  children: [
                                    Icon(CupertinoIcons.profile_circled),
                                    Text("Profile"),
                                  ],
                                ),
                                content: Column(
                                  children: [
                                    Text("${user.firstName} ${user.lastName}"),
                                    Text(user.email),
                                    Text(user.institution),
                                    BlocBuilder<VersionCubit, VersionState>(
                                      bloc: VersionCubit(
                                          context.read<AuthDataProvider>())
                                        ..getVersion(),
                                      builder: (context, state) {
                                        return switch (state) {
                                          VersionLoadSuccess(
                                            version: var version
                                          ) =>
                                            Text("API Version: $version"),
                                          VersionLoadFailure(
                                            error: var error
                                          ) =>
                                            Text(
                                                "Failed to get API version: $error"),
                                          VersionLoadInProgress() =>
                                            const Center(
                                              child:
                                                  CupertinoActivityIndicator(),
                                            ),
                                          _ => const SizedBox.shrink(),
                                        };
                                      },
                                    )
                                  ],
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text("Close"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    child: const Text("Logout"),
                                    onPressed: () {
                                      context
                                          .read<CredentialsCubit>()
                                          .deleteCredentials();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        UserInfoLoadInProgress() => const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        _ => const SizedBox.shrink(),
                      };
                    },
                  ),
                ),
                const SliverFillRemaining(
                  child: Center(
                    child: Text('Jobs Page'),
                  ),
                ),
              ],
            ),
          ),
        ),
      _ => const Center(
          child: Text('Jobs Page'),
        ),
    };
  }
}
