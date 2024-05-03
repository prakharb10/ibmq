import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/user/usage/cubit/user_usage_cubit.dart';
import 'package:intl/intl.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class UserUsageTile extends StatelessWidget {
  const UserUsageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstanceFilterCubit, Option<String>>(
      builder: (context, state) => switch (state) {
        Some(:final value) => BlocBuilder<UserUsageCubit, UserUsageState>(
            builder: (context, state) => switch (state) {
              LoadInProgress() => switch (Theme.of(context).platform) {
                  TargetPlatform.macOS => const Center(
                      child: ProgressCircle(),
                    ),
                  TargetPlatform.linux => const Center(
                      child: YaruCircularProgressIndicator(),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                },
              LoadSuccess(:final userUsage) => switch (IOOption.tryCatch(() =>
                        userUsage.byInstance
                            .firstWhere((element) => element.instance == value))
                    .run()) {
                  Some(:final value) => switch (Theme.of(context).platform) {
                      TargetPlatform.macOS => MacosListTile(
                          leading: const MacosIcon(CupertinoIcons.graph_square),
                          title: MacosTooltip(
                            message:
                                "Usage Period: ${DateFormat.yMMMd().format(userUsage.period.start)} - ${DateFormat.yMMMd().format(userUsage.period.end)}",
                            child: const Text("Usage"),
                          ),
                          subtitle: MacosTooltip(
                            message:
                                "Used: ${value.usage} Remaining: ${value.quota - value.usage}",
                            child: CapacityIndicator(
                              value: value.usage / value.quota * 100,
                            ),
                          ),
                        ),
                      TargetPlatform.linux => YaruMasterTile(
                          leading: const Icon(YaruIcons.monitor),
                          title: Tooltip(
                            message:
                                "Usage Period: ${DateFormat.yMMMd().format(userUsage.period.start)} - ${DateFormat.yMMMd().format(userUsage.period.end)}",
                            child: const Text("Usage"),
                          ),
                          subtitle: Tooltip(
                            message:
                                "Used: ${value.usage} Remaining: ${value.quota - value.usage}",
                            child: YaruLinearProgressIndicator(
                              value: value.usage / value.quota,
                            ),
                          ),
                        ),
                      _ => ListTile(
                          leading: const Icon(Icons.auto_graph),
                          title: Tooltip(
                            message:
                                "Usage Period: ${DateFormat.yMMMd().format(userUsage.period.start)} - ${DateFormat.yMMMd().format(userUsage.period.end)}",
                            child: const Text("Usage"),
                          ),
                          subtitle: Tooltip(
                            message:
                                "Used: ${value.usage} Remaining: ${value.quota - value.usage}",
                            child: LinearProgressIndicator(
                              value: value.usage / value.quota,
                            ),
                          ),
                        )
                    },
                  None() => const SizedBox.shrink(),
                },
              _ => const SizedBox.shrink(),
            },
          ),
        None() => const SizedBox.shrink(),
      },
    );
  }
}
