import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/auth/cubit/credentials_cubit.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/user/info/model/user.dart';
import 'package:ibmq/utils/version/cubit/version_cubit.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class UserInfoDialog extends StatelessWidget {
  const UserInfoDialog({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) => switch (Theme.of(context).platform) {
        TargetPlatform.macOS => MacosAlertDialog(
            appIcon: const MacosIcon(
              CupertinoIcons.profile_circled,
              size: 64,
            ),
            title: const Text("Profile"),
            message: Column(
              children: [
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email),
                Text(user.institution),
                const MacosPulldownMenuDivider(),
                BlocBuilder<VersionCubit, VersionState>(
                  bloc: VersionCubit(context.read<AuthDataProvider>())
                    ..getVersion(),
                  builder: (context, state) {
                    return switch (state) {
                      VersionLoadSuccess(version: var version) =>
                        Text("API Version: $version"),
                      VersionLoadFailure(error: var error) =>
                        Text("Failed to get API version: $error"),
                      VersionLoadInProgress() => const Center(
                          child: ProgressCircle(),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                )
              ],
            ),
            primaryButton: PushButton(
              controlSize: ControlSize.large,
              onPressed: () {
                context.read<CredentialsCubit>().deleteCredentials();
                Navigator.of(context).pop();
              },
              child: const Text("Logout"),
            ),
            secondaryButton: PushButton(
              controlSize: ControlSize.large,
              secondary: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ),
        TargetPlatform.iOS => CupertinoAlertDialog(
            title: const Column(
              children: [
                Icon(CupertinoIcons.profile_circled),
                Text("Profile"),
              ],
            ),
            content: Column(
              children: [
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email),
                Text(user.institution),
                BlocBuilder<VersionCubit, VersionState>(
                  bloc: VersionCubit(context.read<AuthDataProvider>())
                    ..getVersion(),
                  builder: (context, state) {
                    return switch (state) {
                      VersionLoadSuccess(version: var version) =>
                        Text("API Version: $version"),
                      VersionLoadFailure(error: var error) =>
                        Text("Failed to get API version: $error"),
                      VersionLoadInProgress() => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                )
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text("Close"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text("Logout"),
                onPressed: () {
                  context.read<CredentialsCubit>().deleteCredentials();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        TargetPlatform.linux => AlertDialog(
            title: const YaruDialogTitleBar(
              title: Text("Profile"),
              leading: Icon(YaruIcons.user),
            ),
            titlePadding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.all(kYaruPagePadding),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email),
                Text(user.institution),
                const Divider(),
                BlocBuilder<VersionCubit, VersionState>(
                  bloc: VersionCubit(context.read<AuthDataProvider>())
                    ..getVersion(),
                  builder: (context, state) {
                    return switch (state) {
                      VersionLoadSuccess(version: var version) =>
                        Text("API Version: $version"),
                      VersionLoadFailure(error: var error) =>
                        Text("Failed to get API version: $error"),
                      VersionLoadInProgress() => const Center(
                          child: YaruLinearProgressIndicator(),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  context.read<CredentialsCubit>().deleteCredentials();
                  Navigator.of(context).pop();
                },
                child: const Text("Logout"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
        TargetPlatform.windows => fluent.ContentDialog(
            title: const Text("Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email),
                Text(user.institution),
                const fluent.Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: fluent.Divider(),
                ),
                BlocBuilder<VersionCubit, VersionState>(
                  bloc: VersionCubit(context.read<AuthDataProvider>())
                    ..getVersion(),
                  builder: (context, state) {
                    return switch (state) {
                      VersionLoadSuccess(version: var version) =>
                        Text("API Version: $version"),
                      VersionLoadFailure(error: var error) =>
                        Text("Failed to get API version: $error"),
                      VersionLoadInProgress() => const Center(
                          child: fluent.ProgressBar(),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                )
              ],
            ),
            actions: [
              fluent.Button(
                child: const Text("Close"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              fluent.FilledButton(
                child: const Text("Logout"),
                onPressed: () {
                  context.read<CredentialsCubit>().deleteCredentials();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        _ => const SizedBox.shrink(),
      };
}
