import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/auth_cubit.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/router.dart';
import 'package:ibmq/user/info/cubit/user_info_cubit.dart';
import 'package:ibmq/utils/data_clients/cubit/data_clients_cubit.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _controller = TextEditingController();
  bool _valid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _valid = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CredentialsCubit>().loadCredentials();
    });
    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login to IBM Quantum",
          style: switch (Theme.of(context).platform) {
            TargetPlatform.macOS =>
              MacosTheme.of(context).typography.largeTitle,
            TargetPlatform.iOS =>
              cupertino.CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            TargetPlatform.windows =>
              fluent.FluentTheme.of(context).typography.title,
            _ => Theme.of(context).textTheme.headlineLarge,
          },
        ),
        const Text("Copy your API token from your IBM Quantum account page."),
        ...switch (Theme.of(context).platform) {
          TargetPlatform.macOS => [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MacosTextField(
                  controller: _controller,
                  placeholder: "API Token",
                  clearButtonMode: OverlayVisibilityMode.editing,
                  onSubmitted: (_) {
                    if (_valid) {
                      context.read<AuthCubit>().tokenLogin(_controller.text);
                    }
                  },
                ),
              ),
              PushButton(
                controlSize: ControlSize.large,
                onPressed: _valid
                    ? () =>
                        context.read<AuthCubit>().tokenLogin(_controller.text)
                    : null,
                child: const Text("Login"),
              ),
            ],
          TargetPlatform.iOS => [
              cupertino.Padding(
                padding: const EdgeInsets.all(8.0),
                child: cupertino.CupertinoTextField(
                  controller: _controller,
                  placeholder: "API Token",
                  onSubmitted: (_) {
                    if (_valid) {
                      context.read<AuthCubit>().tokenLogin(_controller.text);
                    }
                  },
                  clearButtonMode: cupertino.OverlayVisibilityMode.editing,
                ),
              ),
              cupertino.CupertinoButton.filled(
                onPressed: _valid
                    ? () =>
                        context.read<AuthCubit>().tokenLogin(_controller.text)
                    : null,
                child: const Text("Login"),
              ),
            ],
          TargetPlatform.windows => [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fluent.TextBox(
                  controller: _controller,
                  placeholder: "API Token",
                  onSubmitted: (_) {
                    if (_valid) {
                      context.read<AuthCubit>().tokenLogin(_controller.text);
                    }
                  },
                ),
              ),
              fluent.FilledButton(
                onPressed: _valid
                    ? () =>
                        context.read<AuthCubit>().tokenLogin(_controller.text)
                    : null,
                child: const Text("Login"),
              ),
            ],
          _ => [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: "API Token",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your token";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              ElevatedButton(
                onPressed: _valid
                    ? () =>
                        context.read<AuthCubit>().tokenLogin(_controller.text)
                    : null,
                child: const Text("Login"),
              ),
            ],
        },
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is TokenLoginSuccess) {
                context.read<UserInfoCubit>().loadUserInfo(state.accessToken);
              }
            },
            builder: (context, state) {
              return switch (state) {
                TokenLoginInProgress() => switch (Theme.of(context).platform) {
                    TargetPlatform.macOS => const ProgressCircle(),
                    TargetPlatform.linux =>
                      const YaruCircularProgressIndicator(),
                    TargetPlatform.windows => const fluent.ProgressRing(),
                    _ => const CircularProgressIndicator.adaptive()
                  },
                TokenLoginFailure(message: var message) => Text(message),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        )
      ],
    );
    return BlocListener<DataClientsCubit, DataClientsState>(
      listener: (context, state) {
        if (state is DataClientsCreateSuccess) {
          JobsRoute().go(context);
        }
      },
      listenWhen: (previous, current) => current is DataClientsCreateSuccess,
      child: BlocConsumer<UserInfoCubit, UserInfoState>(
        listener: (context, state) {
          switch (state) {
            case UserInfoLoadSuccess(:final user, :final accessToken):
              context.read<DataClientsCubit>().createDataClients(
                    accessToken: accessToken,
                    httpBaseUrl: user.urls.http,
                    runtimeBaseUrl: user.urls.services.runtime,
                  );
              break;
            default:
          }
        },
        listenWhen: (previous, current) => current is UserInfoLoadSuccess,
        builder: (context, state) {
          return switch (state) {
            UserInfoLoadInProgress() => switch (Theme.of(context).platform) {
                TargetPlatform.macOS => MacosWindow(
                    child: MacosScaffold(
                      children: [
                        ContentArea(
                          builder: (context, scrollController) => const Center(
                            child: ProgressCircle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                TargetPlatform.iOS => const cupertino.CupertinoPageScaffold(
                    child:
                        Center(child: cupertino.CupertinoActivityIndicator()),
                  ),
                TargetPlatform.linux => const Scaffold(
                    body: Center(
                      child: YaruCircularProgressIndicator(),
                    ),
                  ),
                TargetPlatform.windows => fluent.NavigationView(
                    content: fluent.ScaffoldPage.withPadding(
                      content: const Center(
                        child: fluent.ProgressRing(),
                      ),
                    ),
                  ),
                _ => const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              },
            UserInfoLoadFailure(message: var message) => switch (
                  Theme.of(context).platform) {
                TargetPlatform.macOS => MacosWindow(
                    child: MacosScaffold(
                      children: [
                        ContentArea(
                          builder: (context, scrollController) => Center(
                            child: Text('Failed to load user info: $message'),
                          ),
                        ),
                      ],
                    ),
                  ),
                TargetPlatform.iOS => cupertino.CupertinoPageScaffold(
                    child: Center(
                        child: Text('Failed to load user info: $message')),
                  ),
                TargetPlatform.linux => Scaffold(
                    body: Center(
                      child: Text('Failed to load user info: $message'),
                    ),
                  ),
                TargetPlatform.windows => fluent.NavigationView(
                    content: fluent.ScaffoldPage.withPadding(
                      content: Text('Failed to load user info: $message'),
                    ),
                  ),
                _ => Scaffold(
                    body: Center(
                      child: Text('Failed to load user info: $message'),
                    ),
                  ),
              },
            _ => BlocConsumer<CredentialsCubit, CredentialsState>(
                listener: (context, state) {
                  switch (state) {
                    case CredentialsLoadSuccess(
                          accessToken: String? accessToken,
                          token: String? token
                        )
                        when (accessToken != null && token != null):
                      context.read<UserInfoCubit>().loadUserInfo(accessToken);
                      break;
                    case CredentialsLoadSuccess(token: String? token)
                        when token != null:
                      _controller.text = token;
                      context.read<AuthCubit>().tokenLogin(token);
                      break;
                    default:
                      break;
                  }
                },
                builder: (context, state) => switch (state) {
                  CredentialsInitial() => switch (Theme.of(context).platform) {
                      TargetPlatform.macOS => MacosWindow(
                          child: MacosScaffold(
                            children: [
                              ContentArea(
                                builder: (context, scrollController) =>
                                    const Center(
                                  child: ProgressCircle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      TargetPlatform.iOS =>
                        const cupertino.CupertinoPageScaffold(
                          child: Center(
                              child: cupertino.CupertinoActivityIndicator()),
                        ),
                      TargetPlatform.linux => const Scaffold(
                          body: Center(
                            child: YaruCircularProgressIndicator(),
                          ),
                        ),
                      TargetPlatform.windows => fluent.NavigationView(
                          content: fluent.ScaffoldPage.withPadding(
                            content: const Center(
                              child: fluent.ProgressRing(),
                            ),
                          ),
                        ),
                      _ => const Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    },
                  CredentialsLoadFailure() => switch (
                        Theme.of(context).platform) {
                      TargetPlatform.macOS => MacosWindow(
                          child: MacosScaffold(
                            children: [
                              ContentArea(
                                builder: (context, scrollController) =>
                                    const Center(
                                  child: Text('Failed to load credentials'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      TargetPlatform.iOS =>
                        const cupertino.CupertinoPageScaffold(
                          child:
                              Center(child: Text('Failed to load credentials')),
                        ),
                      TargetPlatform.linux => const Scaffold(
                          body: Center(
                            child: Text('Failed to load credentials'),
                          ),
                        ),
                      TargetPlatform.windows => fluent.NavigationView(
                          content: fluent.ScaffoldPage.withPadding(
                            header: const fluent.PageHeader(
                                title: Text("IBM Quantum")),
                            content: const Text("Failed to load credentials"),
                          ),
                        ),
                      _ => const Scaffold(
                          body: Center(
                            child: Text('Failed to load credentials'),
                          ),
                        ),
                    },
                  CredentialsLoadSuccess() => switch (
                        Theme.of(context).platform) {
                      TargetPlatform.macOS => MacosWindow(
                          child: MacosScaffold(
                            children: [
                              ContentArea(
                                builder: (context, scrollController) => Center(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(16.0),
                                    controller: scrollController,
                                    child: body,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      TargetPlatform.iOS => cupertino.CupertinoPageScaffold(
                          navigationBar: const cupertino.CupertinoNavigationBar(
                            middle: Text("IBM Quantum"),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: body,
                          ),
                        ),
                      TargetPlatform.linux => YaruDetailPage(
                          appBar: const YaruWindowTitleBar(
                            title: Text("IBM Quantum"),
                          ),
                          body: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: body,
                          ),
                        ),
                      TargetPlatform.windows => fluent.NavigationView(
                          content: fluent.ScaffoldPage.withPadding(
                            header: const fluent.PageHeader(
                                title: Text("IBM Quantum")),
                            content: body,
                          ),
                        ),
                      _ => Scaffold(
                          appBar: AppBar(
                            title: const Text("IBM Quantum"),
                          ),
                          body: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: body,
                          ),
                        ),
                    },
                  _ => const SizedBox.shrink(),
                },
              ),
          };
        },
      ),
    );
  }
}
