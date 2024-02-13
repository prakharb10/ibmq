import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibmq/auth/auth_page.dart';
import 'package:ibmq/auth/cubit/auth_cubit.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/auth/data/creds_repository.dart';
import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/jobs/jobs_page.dart';
import 'package:ibmq/main.dart';
import 'package:ibmq/auth/login_page.dart';
import 'package:ibmq/user/cubit/user_cubit.dart';

part 'router.g.dart';

@TypedShellRoute<AppShellRouteData>(
    routes: [TypedGoRoute<JobsRoute>(path: '/jobs')])
class AppShellRouteData extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BlocProvider(
      create: (context) => UserCubit(authClient: context.read<AuthClient>()),
      child: AppShell(child: navigator),
    );
  }
}

@TypedGoRoute<AuthRoute>(path: '/')
class AuthRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => CredentialsCubit(context.read<CredsRepository>()),
      child: const AuthPage(),
    );
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  final String? $extra;

  LoginRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => AuthCubit(context.read<AuthRepository>()),
      child: LoginPage(token: $extra),
    );
  }
}

class JobsRoute extends GoRouteData {
  final String $extra;

  JobsRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return JobsPage(accessToken: $extra);
  }
}

final router = GoRouter(routes: $appRoutes);
