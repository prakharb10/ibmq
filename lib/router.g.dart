// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
      $authRoute,
    ];

RouteBase get $appShellRouteData => ShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/jobs',
          factory: $JobsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'iqx/:jobId',
              factory: $IQXJobRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'runtime/:jobId',
              factory: $RuntimeJobRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/backends',
          factory: $BackendsRouteExtension._fromState,
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      AppShellRouteData();
}

extension $JobsRouteExtension on JobsRoute {
  static JobsRoute _fromState(GoRouterState state) => JobsRoute();

  String get location => GoRouteData.$location(
        '/jobs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $IQXJobRouteExtension on IQXJobRoute {
  static IQXJobRoute _fromState(GoRouterState state) => IQXJobRoute(
        jobId: state.pathParameters['jobId']!,
      );

  String get location => GoRouteData.$location(
        '/jobs/iqx/${Uri.encodeComponent(jobId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RuntimeJobRouteExtension on RuntimeJobRoute {
  static RuntimeJobRoute _fromState(GoRouterState state) => RuntimeJobRoute(
        jobId: state.pathParameters['jobId']!,
      );

  String get location => GoRouteData.$location(
        '/jobs/runtime/${Uri.encodeComponent(jobId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BackendsRouteExtension on BackendsRoute {
  static BackendsRoute _fromState(GoRouterState state) => BackendsRoute();

  String get location => GoRouteData.$location(
        '/backends',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authRoute => GoRouteData.$route(
      path: '/',
      factory: $AuthRouteExtension._fromState,
    );

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => AuthRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
