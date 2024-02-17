import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/router.dart';
import 'package:macos_ui/macos_ui.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CredentialsCubit>().loadCredentials();
    });
    return BlocConsumer<CredentialsCubit, CredentialsState>(
      listener: (context, state) {
        switch (state) {
          case CredentialsLoadSuccess(
                accessToken: String? accessToken,
                token: String? token
              )
              when (accessToken != null && token != null):
            JobsRoute($extra: accessToken).go(context);
            break;
          case CredentialsLoadSuccess(token: String? token):
            LoginRoute($extra: token).go(context);
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return switch (state) {
          CredentialsInitial() => switch (Theme.of(context).platform) {
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
              TargetPlatform.iOS => const CupertinoPageScaffold(
                  child: Center(child: CupertinoActivityIndicator()),
                ),
              _ => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            },
          CredentialsLoadFailure() => switch (Theme.of(context).platform) {
              TargetPlatform.macOS => MacosWindow(
                  child: MacosScaffold(
                    children: [
                      ContentArea(
                        builder: (context, scrollController) => const Center(
                          child: Text('Failed to load credentials'),
                        ),
                      ),
                    ],
                  ),
                ),
              TargetPlatform.iOS => const CupertinoPageScaffold(
                  child: Center(child: Text('Failed to load credentials')),
                ),
              _ => const Scaffold(
                  body: Center(
                    child: Text('Failed to load credentials'),
                  ),
                ),
            },
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
