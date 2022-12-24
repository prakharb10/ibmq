import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibmq/user/model/user.dart';
import 'package:ibmq/user/views/login_page.dart';
import 'package:ibmq/user/views/user_page.dart';

import 'main.dart';

/// Abstract class for all pages.
abstract class IBMQRoutePath {}

/// Route path for the login page
class LoginPagePath extends IBMQRoutePath {}

/// Route path for the user page
class UserPagePath extends IBMQRoutePath {
  /// User data
  final User user;

  /// Constructor
  UserPagePath({required this.user});
}

/// Route path for the jobs page
class JobsPagePath extends IBMQRoutePath {}

/// Route path for the backends page
class BackendsPagePath extends IBMQRoutePath {}

/// Appstate for the router
class IBMQAppState extends ChangeNotifier {
  /// User token for API requests
  String? _token;

  /// Index of the current page
  int _pageIndex = 0;

  /// User data
  ///
  /// This is set when the user is logged in
  /// and user data is fetched
  User? _user;

  /// Whether to show the profile page
  bool _showProfile = false;

  /// User token for API requests
  String? get token => _token;

  /// User token for API requests
  set token(String? token) {
    _token = token;
    notifyListeners();
  }

  /// Index of the current page
  int get pageIndex => _pageIndex;

  /// Index of the current page
  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  /// User data
  ///
  /// This is set when the user is logged in
  /// and user data is fetched
  User? get user => _user;

  /// User data
  ///
  /// This is set when the user is logged in
  /// and user data is fetched
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  /// Whether to show the profile page
  bool get showProfile => _showProfile;

  /// Whether to show the profile page
  set showProfile(bool showProfile) {
    _showProfile = showProfile;
    notifyListeners();
  }

  /// Check if token is set
  void init() {
    final box = Hive.box('ibmq');
    if (box.containsKey('token')) {
      token = box.get('token');
    }
  }
}

/// Router delegate for the app
///
/// This is used to handle the navigation
/// and to generate the routes
///
/// * See [IBMQRoutePath] for the different routes
/// * See [IBMQAppState] for the app state
class IBMQRouterDelegate extends RouterDelegate<IBMQRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<IBMQRoutePath> {
  /// App state
  final IBMQAppState appState;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Constructor
  IBMQRouterDelegate(this.appState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
    appState.init();
  }

  @override
  IBMQRoutePath? get currentConfiguration {
    if (appState.token == null) {
      return LoginPagePath();
    }
    if (appState.user != null) {
      if (appState.showProfile) {
        return UserPagePath(user: appState.user!);
      }
      switch (appState.pageIndex) {
        case 0:
          return JobsPagePath();
        case 1:
          return BackendsPagePath();
        default:
          return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: appState.user == null
          ? [
              MaterialPage(
                key: const ValueKey('LoginPage'),
                child: LoginPage(
                  appState: appState,
                  token: appState.token,
                ),
              ),
            ]
          : [
              MaterialPage(
                key: const ValueKey('AppShell'),
                child: AppShell(appState: appState),
              ),
              if (appState.showProfile)
                MaterialPage(
                  key: const ValueKey('UserPage'),
                  child: UserPage(user: appState.user!),
                ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.showProfile) {
          appState.showProfile = false;
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(IBMQRoutePath configuration) async {
    if (configuration is LoginPagePath) {
      // appState.token = null;
      // appState.user = null;
    }
    if (configuration is UserPagePath) {
      appState.showProfile = true;
      appState.user = configuration.user;
    }
    if (configuration is JobsPagePath) {
      appState.pageIndex = 0;
    }
    if (configuration is BackendsPagePath) {
      appState.pageIndex = 1;
    }
  }
}

/// Inner router delegate for the app
///
/// This is used to handle the navigation with the bottom navigation bar
///
/// * See [IBMQRoutePath] for the different routes
/// * See [IBMQAppState] for the app state
/// * See [IBMQRouterDelegate] for the parent router delegate
class InnerRouterDelegate extends RouterDelegate<IBMQRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<IBMQRoutePath> {
  /// App state
  IBMQAppState _appState;

  IBMQAppState get appState => _appState;

  set appState(IBMQAppState appState) {
    _appState = appState;
    notifyListeners();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Constructor
  InnerRouterDelegate(this._appState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    _appState.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [
        MaterialPage(child: Scaffold(body: Center(child: Text('Jobs')))),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.showProfile) {
          appState.showProfile = false;
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(IBMQRoutePath configuration) async {
    // Not required
  }
}
