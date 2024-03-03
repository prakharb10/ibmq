import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/hgp/cubit/hgp_cubit.dart';
import 'package:ibmq/hgp/cubit/instance_cubit.dart';
import 'package:ibmq/hgp/model/hub.dart';
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
    context.read<HgpCubit>().loadHgp();
    // context.read<CursorsBloc>().add(GetCursors());
    // context.read<JobsCacheCubit>().getJobs();
  }

  IO<IList<String>> hgpEntries(List<Hub> hgps) => IO(() => hgps
      .flatMap((h) => h.groups.entries.flatMap((g) => g.value.projects.entries
          .flatMap((p) => ["${h.name}/${g.key}/${p.key}"])))
      .toIList());

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosScaffold(
          toolBar: ToolBar(
            actions: [
              CustomToolbarItem(
                tooltipMessage: "Current Instance",
                inToolbarBuilder: (context) => BlocConsumer<HgpCubit, HgpState>(
                  listener: (context, state) => switch (state) {
                    HgpLoadSuccess(hgps: final hgps) => context
                        .read<InstanceCubit>()
                        .changeInstance(hgpEntries(hgps).run().first),
                    _ => null,
                  },
                  builder: (context, state) {
                    return switch (state) {
                      HgpLoadSuccess(hgps: var hgps) =>
                        BlocBuilder<InstanceCubit, String?>(
                          builder: (context, state) {
                            return MacosPopupButton<String>(
                              value: state,
                              hint: const Text("Select HGP"),
                              items: hgpEntries(hgps)
                                  .run()
                                  .map((t) => MacosPopupMenuItem(
                                      value: t, child: Text(t)))
                                  .toList(),
                              onChanged: (value) => context
                                  .read<InstanceCubit>()
                                  .changeInstance(value),
                            );
                          },
                        ),
                      HgpLoadInProgress() => const MacosTooltip(
                          message: "Loading HGP",
                          child: ProgressCircle(),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              )
            ],
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) => const Center(
                child: Text('Jobs Page'),
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
                                          context.read<AuthClient>())
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
