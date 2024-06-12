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
import 'package:ibmq/jobs/job/iqx/cubit/iqx_job_cubit.dart';
import 'package:ibmq/jobs/job/iqx/iqx_job_page.dart';
import 'package:ibmq/jobs/job/iqx/iqx_job_repository.dart';
import 'package:ibmq/jobs/job/runtime/bloc/runtime_job_bloc.dart';
import 'package:ibmq/jobs/job/runtime/runtime_job_page.dart';
import 'package:ibmq/jobs/jobs_page.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:ibmq/jobs/job/runtime/runtime_job_repository.dart';
import 'package:ibmq/main.dart';
import 'package:ibmq/user/jobs_updates/bloc/user_jobs_updates_bloc.dart';
import 'package:ibmq/user/usage/cubit/user_usage_cubit.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:ibmq/utils/notifications/local_notifications.dart';
import 'package:ibmq/utils/notifications/permissions/cubit/notification_permissions_cubit.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'router.g.dart';

@TypedShellRoute<AppShellRouteData>(routes: [
  TypedGoRoute<JobsRoute>(
    path: '/jobs',
    routes: [
      TypedGoRoute<IQXJobRoute>(path: 'iqx/:jobId'),
      TypedGoRoute<RuntimeJobRoute>(path: 'runtime/:jobId'),
    ],
  )
])
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
            BlocProvider(
              create: (context) => UserUsageCubit(
                instancesRepository: context.read<InstancesRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => UserJobsUpdatesBloc(
                runtimeDataProvider: (context.read<DataClientsCubit>().state
                        as DataClientsCreateSuccess)
                    .runtimeDataProvider,
              ),
            ),
            BlocProvider(
              create: (context) => NotificationsBloc(),
            ),
            BlocProvider(
              create: (context) => NotificationPermissionsCubit(
                localNotifications:
                    RepositoryProvider.of<LocalNotifications>(context),
              ),
            )
          ],
          child: switch (Theme.of(context).platform) {
            TargetPlatform.macOS => Theme(
                data: ThemeData(
                  brightness: MacosTheme.brightnessOf(context),
                  colorSchemeSeed: MacosTheme.of(context).primaryColor,
                  canvasColor: MacosTheme.of(context).canvasColor,
                  iconTheme: IconThemeData(
                    color: MacosTheme.of(context).iconTheme.color,
                    opacity: MacosTheme.of(context).iconTheme.opacity,
                    size: MacosTheme.of(context).iconTheme.size,
                  ),
                ),
                child: AppShell(child: navigator),
              ),
            _ => AppShell(child: navigator)
          },
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

class IQXJobRoute extends GoRouteData {
  final String jobId;
  const IQXJobRoute({required this.jobId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
      create: (context) => IQXJobRepository(
          httpDataProvider: (context.read<DataClientsCubit>().state
                  as DataClientsCreateSuccess)
              .httpDataProvider),
      child: switch (Theme.of(context).platform) {
        TargetPlatform.macOS => MacosScaffold(
            toolBar: ToolBar(
              title: Text(jobId),
            ),
            children: [
              ContentArea(
                builder: (context, scrollController) => body(scrollController),
              )
            ],
          ),
        _ => Scaffold(
            appBar: AppBar(
              title: Text(jobId),
            ),
            body: body(),
          ),
      },
    );
  }

  BlocProvider<IqxJobCubit> body([ScrollController? scrollController]) {
    return BlocProvider(
      create: (context) => IqxJobCubit(
        iqxJobRepository: RepositoryProvider.of<IQXJobRepository>(context),
      ),
      child: IQXJobPage(
        jobId: jobId,
        scrollController: scrollController,
      ),
    );
  }
}

class RuntimeJobRoute extends GoRouteData {
  final String jobId;
  const RuntimeJobRoute({required this.jobId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
      create: (context) => RuntimeJobRepository(
        runtimeDataProvider:
            (context.read<DataClientsCubit>().state as DataClientsCreateSuccess)
                .runtimeDataProvider,
      ),
      child: switch (Theme.of(context).platform) {
        TargetPlatform.macOS => MacosScaffold(
            toolBar: ToolBar(
              title: Text(jobId),
            ),
            children: [
              ContentArea(
                builder: (context, scrollController) => body(scrollController),
              )
            ],
          ),
        _ => Scaffold(
            appBar: AppBar(
              title: Text(jobId),
            ),
            body: body(),
          ),
      },
    );
  }

  BlocProvider<RuntimeJobBloc> body([ScrollController? scrollController]) {
    return BlocProvider(
      create: (context) => RuntimeJobBloc(
        runtimeJobRepository:
            RepositoryProvider.of<RuntimeJobRepository>(context),
      ),
      child: RuntimeJobPage(
        jobId: jobId,
        scrollController: scrollController,
      ),
    );
  }
}

final router = GoRouter(
  routes: $appRoutes,
  observers: [TalkerRouteObserver(talker)],
);
