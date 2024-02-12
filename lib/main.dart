import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/auth/data/creds_repository.dart';
import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:ibmq/router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDataProvider.init();
  await HiveDataProvider.openBoxes();
  runApp(const MyApp());
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
      child: MaterialApp.router(
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
    );
  }
}

class AppShell extends StatelessWidget {
  // final IBMQAppState appState;
  // final Dio dio;
  // final Dio runtimeDio;
  final Widget child;
  const AppShell({
    super.key,
    required this.child,
    // required this.appState,
    // required this.dio,
    // required this.runtimeDio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBM Quantum'),
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
    );
  }
}
