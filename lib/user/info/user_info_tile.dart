import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/user/info/cubit/user_info_cubit.dart';
import 'package:ibmq/user/info/model/user.dart';
import 'package:ibmq/user/info/user_info_dialog.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) => switch (Theme.of(context).platform) {
        TargetPlatform.macOS => switch (state) {
            UserInfoLoadSuccess(user: var user) => MacosListTile(
                leading: const MacosIcon(CupertinoIcons.profile_circled),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                onClick: () => showMacosAlertDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => UserInfoDialog(user: user),
                ),
              ),
            UserInfoLoadInProgress() => const Center(
                child: ProgressCircle(),
              ),
            _ => const SizedBox.shrink(),
          },
        TargetPlatform.iOS => switch (state) {
            UserInfoLoadSuccess(user: var user) => GestureDetector(
                child: const Icon(CupertinoIcons.profile_circled),
                onTap: () => showCupertinoDialog(
                  context: context,
                  builder: (context) => UserInfoDialog(user: user),
                ),
              ),
            UserInfoLoadInProgress() => const Center(
                child: CupertinoActivityIndicator(),
              ),
            _ => const SizedBox.shrink(),
          },
        TargetPlatform.linux => switch (state) {
            UserInfoLoadSuccess(user: var user) => YaruMasterTile(
                leading: const Icon(YaruIcons.user),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.email),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => UserInfoDialog(user: user),
                ),
              ),
            UserInfoLoadInProgress() => const Center(
                child: YaruCircularProgressIndicator(),
              ),
            _ => const SizedBox.shrink(),
          },
        _ => const SizedBox.shrink(),
      },
    );
  }
}

fluent.PaneItem windowsUserInfoTile(
        {required User user, required BuildContext context}) =>
    fluent.PaneItem(
      icon: const Icon(FluentIcons.person_24_regular),
      title: Text("${user.firstName} ${user.lastName}"),
      onTap: () => fluent.showDialog(
        builder: (context) => UserInfoDialog(user: user),
        context: context,
      ),
      body: const SizedBox.shrink(),
    );
