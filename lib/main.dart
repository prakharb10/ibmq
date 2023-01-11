import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibmq/router.dart';
import 'package:ibmq/user/bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('ibmq');
  runApp(
    BlocProvider(
      create: (context) => UserBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IBM Quantum',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF491d8b),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF491d8b),
      ),
      routerConfig: RouterConfig(
        routerDelegate: IBMQRouterDelegate(IBMQAppState()),
      ),
    );
  }
}

/// AppShell is a widget that contains the app's navigation bar and body.
///
/// The navigation bar is a [BottomNavigationBar] that is used to navigate between
/// the app's pages.
/// The [InnerRouterDelegate] is used to build the body of the app.
class AppShell extends StatefulWidget {
  final IBMQAppState appState;
  const AppShell({Key? key, required this.appState}) : super(key: key);

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late InnerRouterDelegate _routerDelegate;
  ChildBackButtonDispatcher? _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _routerDelegate = InnerRouterDelegate(widget.appState);
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.appState != oldWidget.appState) {
      _routerDelegate.appState = widget.appState;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher
        ?.createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    if (_backButtonDispatcher != null) {
      _backButtonDispatcher!.takePriority();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBM Quantum'),
        actions: [
          IconButton(
            onPressed: () => widget.appState.showProfile = true,
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.webhook),
            label: "Jobs",
          ),
          NavigationDestination(
            label: "Backends",
            icon: Icon(Icons.device_hub),
          ),
        ],
      ),
    );
  }
}
