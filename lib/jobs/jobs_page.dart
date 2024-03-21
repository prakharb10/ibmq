import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/instances/cubit/instances_cubit.dart';
import 'package:ibmq/jobs/bloc/jobs_bloc.dart';
import 'package:ibmq/user/cubit/user_cubit.dart';
import 'package:ibmq/utils/version/cubit/version_cubit.dart';
import 'package:macos_ui/macos_ui.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  // int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    context.read<InstancesCubit>().loadInstances();
    context.read<JobsBloc>().add(const UserJobsRequested());
    // context.read<CursorsBloc>().add(GetCursors());
    // context.read<JobsCacheCubit>().getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosScaffold(
          toolBar: ToolBar(
            actions: [
              CustomToolbarItem(
                tooltipMessage: "Current Instance",
                inToolbarBuilder: (context) =>
                    BlocConsumer<InstancesCubit, InstancesState>(
                  listener: (context, state) => switch (state) {
                    InstancesLoadSuccess(instances: final instances) => context
                        .read<InstanceFilterCubit>()
                        .changeInstance(instances.first.name),
                    _ => null,
                  },
                  builder: (context, state) => switch (state) {
                    InstancesLoadSuccess(instances: var instances) =>
                      BlocBuilder<InstanceFilterCubit, Option<String>>(
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
              builder: (context, scrollController) => Center(
                child: BlocBuilder<JobsBloc, JobsState>(
                  builder: (context, state) => switch (state) {
                    JobsLoadInProgress() => const ProgressCircle(),
                    JobsLoadSuccess(userJobs: var userJobs) =>
                      Text(userJobs.toString()),
                    JobsLoadFailure(error: var error) => Text(error),
                    _ => const SizedBox.shrink(),
                  },
                ),
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
    // return AsyncPaginatedDataTable2(
    //   columns: const [
    //     DataColumn2(label: Text("Job Id")),
    //     DataColumn2(label: Text("Status")),
    //     DataColumn2(label: Text("Created")),
    //     DataColumn2(label: Text("Run")),
    //     DataColumn2(label: Text("Program")),
    //     DataColumn2(
    //       label: Text("Compute Resource"),
    //       size: ColumnSize.L,
    //     ),
    //     DataColumn2(
    //       label: Text("Provider"),
    //       size: ColumnSize.L,
    //     ),
    //     DataColumn2(label: Text("QR Usage")),
    //     DataColumn2(label: Text("Tags")),
    //   ],
    //   source: JobsDataTableSource(
    //     dio: widget.dio,
    //     runtimeDio: widget.runtimeDio,
    //     // appState: widget.appState,
    //     bloc: context.read<CursorsBloc>(),
    //     jobsCacheCubit: context.read<JobsCacheCubit>(),
    //   ),
    //   wrapInCard: false,
    //   fixedLeftColumns: 1,
    //   minWidth: 1600,
    //   sortColumnIndex: 2,
    //   // TODO: Handle changing rows per page
    //   // rowsPerPage: _rowsPerPage,
    //   // availableRowsPerPage: const [10, 20, 50],
    //   // onRowsPerPageChanged: (value) => _rowsPerPage = value!,
    // );
  }
}
