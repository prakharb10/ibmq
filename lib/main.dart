import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/auth/data/creds_repository.dart';
import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:ibmq/router.dart';
import 'package:ibmq/user/cubit/user_cubit.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:ibmq/utils/version/cubit/version_cubit.dart';
import 'package:macos_ui/macos_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDataProvider.init();
  await HiveDataProvider.openBoxes();
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    await _configureMacosWindowUtils();
  }
  runApp(const MyApp());
}

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    toolbarStyle: NSWindowToolbarStyle.expanded,
  );
  await config.apply();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _hiveDataProvider = HiveDataProvider();
  final _dio = Dio();
  late final AuthClient _authClient;

  @override
  void initState() {
    super.initState();
    _authClient = AuthClient(_dio);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _authClient,
        ),
        RepositoryProvider(
          create: (context) =>
              CredsRepository(hiveDataProvider: _hiveDataProvider),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            authClient: _authClient,
            hiveDataProvider: _hiveDataProvider,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CredentialsCubit(context.read<CredsRepository>()),
          ),
          BlocProvider(
            create: (context) => UserCubit(authClient: _authClient),
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

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosWindow(
          titleBar: const TitleBar(
            title: Text('IBM Quantum Dashboard'),
          ),
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
            bottom: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return switch (state) {
                  UserInfoLoadSuccess(user: var user) => MacosListTile(
                      leading: const MacosIcon(CupertinoIcons.profile_circled),
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
                                bloc: VersionCubit(context.read<AuthClient>())
                                  ..getVersion(),
                                builder: (context, state) {
                                  return switch (state) {
                                    VersionLoadSuccess(version: var version) =>
                                      Text("API Version: $version"),
                                    VersionLoadFailure(error: var error) =>
                                      Text("Failed to get API version: $error"),
                                    VersionLoadInProgress() => const Center(
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
          ),
          child: child,
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
          tabBuilder: (context, index) => child,
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
          body: child,
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
  }
}
