import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibmq/jobs/cubit/jobs_cache_cubit.dart';
import 'package:ibmq/jobs/cursor/bloc/cursors_bloc.dart';
import 'package:ibmq/jobs/job/cubit/job_cubit.dart';
import 'package:ibmq/jobs/job/job_page.dart';
import 'package:ibmq/jobs/jobs_page.dart';
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

/// Route path for the Job page
class JobPagePath extends IBMQRoutePath {
  /// Job ID
  final String jobId;

  /// Constructor
  JobPagePath({required this.jobId});
}

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

  /// Cookie for API requests
  Cookie? _cookie;

  /// Access token for Runtime API requests
  String? _accessToken;

  /// Whether to show the profile page
  bool _showProfile = false;

  /// Job id for the job page
  ///
  /// This is set when the user navigates to the job page
  String? _jobId;

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

  /// Access token for Runtime API requests
  String? get accessToken => _accessToken;

  /// Access token for Runtime API requests
  set accessToken(String? accessToken) {
    _accessToken = accessToken;
    notifyListeners();
  }

  /// Whether to show the profile page
  bool get showProfile => _showProfile;

  /// Whether to show the profile page
  set showProfile(bool showProfile) {
    _showProfile = showProfile;
    notifyListeners();
  }

  /// Cookie for API requests
  Cookie? get cookie => _cookie;

  /// Cookie for API requests
  set cookie(Cookie? cookie) {
    _cookie = cookie;
    notifyListeners();
  }

  /// Job id for the job page
  ///
  /// This is set when the user navigates to the job page
  String? get jobId => _jobId;

  /// Job id for the job page
  ///
  /// This is set when the user navigates to the job page
  set jobId(String? jobId) {
    _jobId = jobId;
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
          if (appState.jobId != null) {
            return JobPagePath(jobId: appState.jobId!);
          }
          return JobsPagePath();
        case 1:
          return BackendsPagePath();
        default:
          return null;
      }
    }
    return null;
  }

  /// Function to initialize a [Dio] instance for API calls
  Dio initDio() {
    final dio = Dio();
    final cookieJar = CookieJar();
    dio.options.baseUrl = appState.user!.urls.http;
    cookieJar.saveFromResponse(
        Uri.parse(appState.user!.urls.http), [appState.cookie!]);
    dio.interceptors.add(CookieManager(cookieJar));
    return dio;
  }

  /// Function to initialize a [Dio] instance for Runtime API calls
  Dio initRuntimeDio() {
    final dio = Dio();
    dio.options.baseUrl = appState.user!.urls.services['runtime']!;
    dio.options.headers['x-access-token'] = appState.accessToken;
    return dio;
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
                child: AppShell(
                  appState: appState,
                  dio: initDio(),
                  runtimeDio: initRuntimeDio(),
                ),
              ),
              if (appState.jobId != null)
                MaterialPage(
                  key: const ValueKey('JobPage'),
                  child: BlocProvider(
                    create: (context) => JobCubit(initDio()),
                    child: JobPage(
                      jobId: appState.jobId!,
                    ),
                  ),
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
    if (configuration is JobPagePath) {
      appState.jobId = configuration.jobId;
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

  /// Dio instance for API calls
  final Dio _dio;

  /// Dio instance for Runtime API calls
  final Dio _runtimeDio;

  IBMQAppState get appState => _appState;

  set appState(IBMQAppState appState) {
    _appState = appState;
    notifyListeners();
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Constructor
  InnerRouterDelegate(this._appState, this._dio, this._runtimeDio)
      : navigatorKey = GlobalKey<NavigatorState>() {
    _appState.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        _appState.pageIndex == 0
            ? MaterialPage(
                key: const ValueKey('JobsPage'),
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CursorsBloc(),
                    ),
                    BlocProvider(
                      create: (context) => JobsCacheCubit(),
                    ),
                  ],
                  child: JobsPage(
                    dio: _dio,
                    runtimeDio: _runtimeDio,
                    appState: _appState,
                  ),
                ),
              )
            : const MaterialPage(
                child: Scaffold(body: Center(child: Text('Backends')))),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.showProfile) {
          appState.showProfile = false;
        }
        if (appState.jobId != null) {
          appState.jobId = null;
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
