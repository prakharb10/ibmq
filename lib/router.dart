import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibmq/auth/auth_page.dart';
import 'package:ibmq/auth/cubit/auth_cubit.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/auth/data/auth_repository.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/instances/cubit/instances_cubit.dart';
import 'package:ibmq/instances/instances_repository.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:ibmq/jobs/jobs_page.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/runtime_job/runtime_job_repository.dart';
import 'package:ibmq/main.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      child: RepositoryProvider(
        create: (context) => InstancesRepository(
            runtimeDataProvider: (context.read<DataClientsCubit>().state
                    as DataClientsCreateSuccess)
                .runtimeDataProvider),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InstancesCubit(
                  instancesRepository: context.read<InstancesRepository>()),
            ),
            BlocProvider(
              create: (context) => InstanceFilterCubit(),
            ),
          ],
          child: AppShell(child: navigator),
        ),
      ),
    );
  }
}

@TypedGoRoute<AuthRoute>(path: '/')
class AuthRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => AuthCubit(context.read<AuthRepository>()),
      child: const AuthPage(),
    );
  }
}

class JobsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => JobsRepository(
            runtimeDataProvider: (context.read<DataClientsCubit>().state
                    as DataClientsCreateSuccess)
                .runtimeDataProvider,
          ),
        ),
        RepositoryProvider(
          create: (context) => RuntimeJobRepository(
            runtimeDataProvider: (context.read<DataClientsCubit>().state
                    as DataClientsCreateSuccess)
                .runtimeDataProvider,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => JobsFilterBloc(),
        child: const JobsPage(),
      ),
    );
  }
}

final router = GoRouter(
  routes: $appRoutes,
  observers: [TalkerRouteObserver(talker)],
);
