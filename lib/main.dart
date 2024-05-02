import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/auth/data/creds_repository.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/router.dart';
import 'package:ibmq/user/info/cubit/user_info_cubit.dart';
import 'package:ibmq/user/jobs_updates/bloc/user_jobs_updates_bloc.dart';
import 'package:ibmq/user/jobs_updates/model/job_status_update.dart';
import 'package:ibmq/user/usage/cubit/user_usage_cubit.dart';
import 'package:ibmq/user/user_repository.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:ibmq/utils/notifications/local_notifications.dart';
import 'package:ibmq/utils/notifications/permissions/cubit/notification_permissions_cubit.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:ibmq/utils/version/cubit/version_cubit.dart';
import 'package:intl/intl.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TalkerBlocObserver(talker: talker);
  await HiveDataProvider.init();
  await HiveDataProvider.openBoxes();
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    await _configureMacosWindowUtils();
  }
  runApp(MyApp());
}

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    toolbarStyle: NSWindowToolbarStyle.unified,
  );
  await config.apply();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _hiveDataProvider = HiveDataProvider();

  final AuthDataProvider _authDataProvider = AuthDataProvider();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _authDataProvider,
        ),
        RepositoryProvider(
          create: (context) =>
              CredsRepository(hiveDataProvider: _hiveDataProvider),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            authDataProvider: _authDataProvider,
            hiveDataProvider: _hiveDataProvider,
          ),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(authDataProvider: _authDataProvider),
        ),
        RepositoryProvider(
          create: (context) => LocalNotifications(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CredentialsCubit(
                RepositoryProvider.of<CredsRepository>(context)),
          ),
          BlocProvider(
            create: (context) => UserInfoCubit(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => DataClientsCubit(),
          )
        ],
        child: switch (Theme.of(context).platform) {
          TargetPlatform.macOS => MacosApp.router(
              title: 'IBM Quantum',
              themeMode: ThemeMode.system,
              theme: MacosThemeData.light(),
              darkTheme: MacosThemeData.dark(),
              routerConfig: router,
            ),
          TargetPlatform.iOS => CupertinoApp.router(
              title: 'IBM Quantum',
              theme: const CupertinoThemeData(
                primaryColor: Color(0xFF491d8b),
              ),
              routerConfig: router,
            ),
          _ => MaterialApp.router(
              title: 'IBM Quantum',
              themeMode: ThemeMode.system,
              theme: ThemeData(
                brightness: Brightness.light,
                colorSchemeSeed: const Color(0xFF491d8b),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorSchemeSeed: const Color(0xFF491d8b),
              ),
              routerConfig: router,
            ),
        },
      ),
    );
  }
}

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({
    super.key,
    required this.child,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  void initState() {
    super.initState();
    context.read<LocalNotifications>().initialize();
    context.read<UserUsageCubit>().loadUsage();
    context
        .read<UserJobsUpdatesBloc>()
        .add(const UserJobsUpdatesEvent.started());
    // TODO: Move to sidebar component
    context.read<NotificationPermissionsCubit>().checkPermissions();
  }

  @override
  Widget build(BuildContext context) => switch (Theme.of(context).platform) {
        TargetPlatform.macOS => MacosWindow(
            sidebar: Sidebar(
              builder: (context, scrollController) => SidebarItems(
                scrollController: scrollController,
                items: const [
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.function),
                    label: Text('Jobs'),
                  ),
                  SidebarItem(
                    leading: MacosIcon(CupertinoIcons.circle_grid_hex),
                    label: Text('Backends'),
                  ),
                ],
                currentIndex: 0,
                onChanged: (value) {},
              ),
              minWidth: 200,
              bottom: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: BlocBuilder<InstanceFilterCubit, Option<String>>(
                      builder: (context, state) => switch (state) {
                        Some(:final value) =>
                          BlocBuilder<UserUsageCubit, UserUsageState>(
                            builder: (context, state) => switch (state) {
                              LoadInProgress() => const Center(
                                  child: ProgressCircle(),
                                ),
                              LoadSuccess(:final userUsage) => switch (
                                    IOOption.tryCatch(() => userUsage.byInstance
                                        .firstWhere((element) =>
                                            element.instance == value)).run()) {
                                  Some(:final value) => MacosListTile(
                                      leading: const MacosIcon(
                                          CupertinoIcons.graph_square),
                                      title: MacosTooltip(
                                        message:
                                            "Usage Period: ${DateFormat.yMMMd().format(userUsage.period.start)} - ${DateFormat.yMMMd().format(userUsage.period.end)}",
                                        child: const Text("Usage"),
                                      ),
                                      subtitle: MacosTooltip(
                                        message:
                                            "Used: ${value.usage} Remaining: ${value.quota - value.usage}",
                                        child: CapacityIndicator(
                                          value:
                                              value.usage / value.quota * 100,
                                        ),
                                      ),
                                    ),
                                  None() => const SizedBox.shrink(),
                                },
                              _ => const SizedBox.shrink(),
                            },
                          ),
                        None() => const SizedBox.shrink(),
                      },
                    ),
                  ),
                  BlocBuilder<UserInfoCubit, UserInfoState>(
                    builder: (context, state) {
                      return switch (state) {
                        UserInfoLoadSuccess(user: var user) => MacosListTile(
                            leading:
                                const MacosIcon(CupertinoIcons.profile_circled),
                            title: Text("${user.firstName} ${user.lastName}"),
                            subtitle: Text(user.email),
                            // TODO: Move to a separate widget
                            onClick: () => showMacosAlertDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) => MacosAlertDialog(
                                appIcon: const MacosIcon(
                                  CupertinoIcons.profile_circled,
                                  size: 64,
                                ),
                                title: const Text("Profile"),
                                message: Column(
                                  children: [
                                    Text("${user.firstName} ${user.lastName}"),
                                    Text(user.email),
                                    Text(user.institution),
                                    const MacosPulldownMenuDivider(),
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
                                              child: ProgressCircle(),
                                            ),
                                          _ => const SizedBox.shrink(),
                                        };
                                      },
                                    )
                                  ],
                                ),
                                primaryButton: PushButton(
                                  controlSize: ControlSize.large,
                                  onPressed: () {
                                    context
                                        .read<CredentialsCubit>()
                                        .deleteCredentials();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Logout"),
                                ),
                                secondaryButton: PushButton(
                                  controlSize: ControlSize.large,
                                  secondary: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"),
                                ),
                              ),
                            ),
                          ),
                        UserInfoLoadInProgress() => const Center(
                            child: ProgressCircle(),
                          ),
                        _ => const SizedBox.shrink(),
                      };
                    },
                  ),
                ],
              ),
            ),
            endSidebar: Sidebar(
              builder: (context, scrollController) =>
                  BlocListener<UserJobsUpdatesBloc, UserJobsUpdatesState>(
                listener: (context, state) async {
                  switch (state) {
                    case Listening(:final jobStatusUpdate):
                      talker.debug(
                          "Received job status update: $jobStatusUpdate");
                      context
                          .read<NotificationsBloc>()
                          .add(NotificationsEvent.received(jobStatusUpdate));
                      await context.read<LocalNotifications>().sendNotification(
                            id: jobStatusUpdate.id.hashCode,
                            title: jobStatusUpdate.status.name,
                            body: "Job ID: ${jobStatusUpdate.id}",
                          );
                      break;
                    default:
                  }
                },
                child: BlocBuilder<NotificationsBloc, NotificationsState>(
                  builder: (context, state) => switch (state) {
                    Initial() => const Center(
                        child: Text("Listening for job updates..."),
                      ),
                    Loaded(:final jobStatusUpdates) =>
                      jobUpdatesList(scrollController, jobStatusUpdates),
                    _ => const SizedBox.shrink(),
                  },
                ),
              ),
              minWidth: 200,
              shownByDefault: false,
              top: BlocBuilder<NotificationsBloc, NotificationsState>(
                builder: (context, state) => switch (state) {
                  Loaded() => PushButton(
                      controlSize: ControlSize.large,
                      secondary: true,
                      onPressed: () => context.read<NotificationsBloc>().add(
                            const NotificationsEvent.clearAll(),
                          ),
                      child: const Text("Clear All"),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
              bottom: BlocBuilder<NotificationPermissionsCubit,
                  NotificationPermissionsState>(
                builder: (context, state) => switch (state) {
                  Denied() => const MacosListTile(
                      leading: MacosIcon(CupertinoIcons.bell_slash),
                      title: Text("Notifications Denied"),
                      subtitle: Text(
                        "Enable notifications in System Preferences",
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
            ),
            child: widget.child,
          ),
        TargetPlatform.iOS => CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.function),
                  label: 'Jobs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.circle_grid_hex),
                  label: 'Backends',
                ),
              ],
            ),
            tabBuilder: (context, index) => widget.child,
          ),
        _ => Scaffold(
            appBar: AppBar(
              title: const Text('IBM Quantum Dashboard'),
              actions: [
                IconButton(
                  // onPressed: () => appState.showProfile = true,
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                )
              ],
            ),
            body: widget.child,
            // body: appState.pageIndex == 0
            //     ? MultiBlocProvider(
            //         providers: [
            //           BlocProvider(
            //             create: (context) => CursorsBloc(),
            //           ),
            //           BlocProvider(
            //             create: (context) => JobsCacheCubit(),
            //           ),
            //         ],
            //         child: JobsPage(
            //           dio: dio,
            //           runtimeDio: runtimeDio,
            //           appState: appState,
            //         ),
            //       )
            //     : const Center(child: Text('Backends')),
            drawer: const NavigationDrawer(
              // selectedIndex: appState.pageIndex,
              // onDestinationSelected: (index) {
              //   appState.pageIndex = index;
              //   Navigator.of(context).pop();
              // },
              children: [
                NavigationDrawerDestination(
                  icon: Icon(Icons.webhook),
                  label: Text("Jobs"),
                ),
                NavigationDrawerDestination(
                  label: Text("Backends"),
                  icon: Icon(Icons.device_hub),
                ),
              ],
            ),
          ),
      };

// TODO: Move to a separate widget
  ListView jobUpdatesList(ScrollController scrollController,
      Map<String, JobStatusUpdate> jobStatusUpdates) {
    final reversedJobStatusUpdates = jobStatusUpdates.entries.toList()
      ..sort((a, b) => b.value.timestamp.compareTo(a.value.timestamp));
    return ListView.separated(
      controller: scrollController,
      itemCount: jobStatusUpdates.length,
      itemBuilder: (context, index) => MacosListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                reversedJobStatusUpdates[index].value.status.name,
              ),
            ),
            MacosIconButton(
              icon: const MacosIcon(CupertinoIcons.xmark_circle),
              onPressed: () => context.read<NotificationsBloc>().add(
                  NotificationsEvent.clear(
                      reversedJobStatusUpdates[index].value)),
            )
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  reversedJobStatusUpdates[index].value.id,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                DateFormat(DateFormat.HOUR_MINUTE).format(
                    reversedJobStatusUpdates[index].value.timestamp.toLocal()),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const MacosPulldownMenuDivider(),
    );
  }
}
