import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibmq/auth/auth_page.dart';
import 'package:ibmq/auth/cubit/auth_cubit.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/jobs/jobs_page.dart';
import 'package:ibmq/main.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';

part 'router.g.dart';

@TypedShellRoute<AppShellRouteData>(
    routes: [TypedGoRoute<JobsRoute>(path: '/jobs')])
class AppShellRouteData extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BlocListener<CredentialsCubit, CredentialsState>(
      listener: (context, state) {
        AuthRoute().go(context);
      },
      listenWhen: (previous, current) => current is CredentialsDeleteSuccess,
      child: AppShell(child: navigator),
    );
  }
}

@TypedGoRoute<AuthRoute>(path: '/')
class AuthRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(context.read<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => DataClientsCubit(),
        ),
      ],
      child: const AuthPage(),
    );
  }
}

class JobsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const JobsPage();
  }
}

final router = GoRouter(routes: $appRoutes);
