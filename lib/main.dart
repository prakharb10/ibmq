import 'package:fluent_ui/fluent_ui.dart' hide IconButton;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/auth/data/creds_repository.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:ibmq/router.dart';
import 'package:ibmq/user/info/cubit/user_info_cubit.dart';
import 'package:ibmq/user/info/user_info_tile.dart';
import 'package:ibmq/user/jobs_updates/bloc/user_jobs_updates_bloc.dart';
import 'package:ibmq/user/jobs_updates/jobs_updates_widget.dart';
import 'package:ibmq/user/usage/cubit/user_usage_cubit.dart';
import 'package:ibmq/user/usage/user_usage_tile.dart';
import 'package:ibmq/user/user_repository.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:ibmq/utils/notifications/local_notifications.dart';
import 'package:ibmq/utils/notifications/permissions/cubit/notification_permissions_cubit.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:yaru/yaru.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TalkerBlocObserver(talker: talker);
  await HiveDataProvider.init();
  await HiveDataProvider.openBoxes();
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    await _configureMacosWindowUtils();
  }
  if (defaultTargetPlatform == TargetPlatform.linux) {
    await YaruWindowTitleBar.ensureInitialized();
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
          TargetPlatform.linux => YaruTheme(
              builder: (context, theme, child) => MaterialApp.router(
                title: 'IBM Quantum',
                themeMode: ThemeMode.system,
                theme: theme.theme,
                darkTheme: theme.darkTheme,
                routerConfig: router,
              ),
            ),
          TargetPlatform.windows => FluentApp.router(
              title: 'IBM Quantum',
              themeMode: ThemeMode.system,
              routerConfig: router,
              theme: FluentThemeData.light(),
              darkTheme: FluentThemeData.dark(),
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
              bottom: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: UserUsageTile(),
                  ),
                  UserInfoTile(),
                ],
              ),
            ),
            endSidebar: Sidebar(
              builder: (context, scrollController) => JobsUpdatesWidget(
                scrollController: scrollController,
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
        TargetPlatform.linux => YaruMasterDetailPage(
            length: 2,
            tileBuilder: (context, index, selected, availableWidth) =>
                switch (index) {
              0 => YaruMasterTile(
                  title: const Text('Jobs'),
                  leading: const Icon(YaruIcons.ubuntu_logo_simple),
                  selected: selected,
                ),
              1 => YaruMasterTile(
                  title: const Text('Backends'),
                  leading: const Icon(YaruIcons.chip),
                  selected: selected,
                ),
              _ => const SizedBox.shrink(),
            },
            bottomBar: const Column(
              children: [
                UserUsageTile(),
                UserInfoTile(),
              ],
            ),
            pageBuilder: (context, index) => widget.child,
          ),
        TargetPlatform.windows => NavigationView(
            pane: NavigationPane(
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.project_collection),
                  title: const Text('Jobs'),
                  body: const SizedBox.shrink(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.processing),
                  title: const Text('Backends'),
                  body: const SizedBox.shrink(),
                ),
              ],
            ),
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
}
