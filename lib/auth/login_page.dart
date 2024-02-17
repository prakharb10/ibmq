import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/auth_cubit.dart';
import 'package:ibmq/router.dart';
import 'package:macos_ui/macos_ui.dart';

class LoginPage extends StatefulWidget {
  /// Token to use for login
  ///
  /// If this is null, the user will be prompted to enter a token
  final String? token;
  const LoginPage({
    super.key,
    this.token,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;
  bool _valid = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.token);
    _controller.addListener(() {
      setState(() {
        _valid = _controller.text.isNotEmpty;
      });
    });
    if (widget.token != null) {
      context.read<AuthCubit>().tokenLogin(widget.token!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          _ => [
              TextFormField(
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
              ElevatedButton(
                onPressed: _valid
                    ? () =>
                        context.read<AuthCubit>().tokenLogin(_controller.text)
                    : null,
                child: const Text("Login"),
              ),
            ],
        },
        cupertino.Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is TokenLoginSuccess) {
                JobsRoute($extra: state.accessToken).go(context);
              }
            },
            builder: (context, state) {
              return switch (state) {
                TokenLoginInProgress() =>
                  Theme.of(context).platform == TargetPlatform.macOS
                      ? const ProgressCircle()
                      : const CircularProgressIndicator.adaptive(),
                TokenLoginFailure(message: var message) => Text(message),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        )
      ],
    );
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosWindow(
          titleBar: const TitleBar(
            title: Text("IBM Quantum"),
          ),
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
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: body,
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(
            title: const Text("IBM Quantum"),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: body,
          ),
        ),
    };
  }
}
