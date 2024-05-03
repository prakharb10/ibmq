import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/instances/cubit/instance_fliter_cubit.dart';
import 'package:ibmq/instances/cubit/instances_cubit.dart';
import 'package:ibmq/jobs/bloc/jobs_filter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class InstanceSelector extends StatelessWidget {
  const InstanceSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstancesCubit, InstancesState>(
      listener: (context, state) {
        switch (state) {
          case InstancesLoadSuccess(instances: final instances):
            context
                .read<InstanceFilterCubit>()
                .changeInstance(instances.first.name);
            // The first event on the InstanceFilterCubit is not
            // triggering the listener, so we need to manually
            // trigger the JobsFilterBloc event.
            context.read<JobsFilterBloc>().add(
                  JobsFilterEvent.providerChanged(
                      provider: instances.first.name),
                );
            break;
          default:
            break;
        }
      },
      builder: (context, state) => switch (state) {
        InstancesLoadSuccess(instances: var instances) =>
          BlocConsumer<InstanceFilterCubit, Option<String>>(
            listener: (context, state) {
              switch (state) {
                case Some(:final value):
                  context.read<JobsFilterBloc>().add(
                        JobsFilterEvent.providerChanged(provider: value),
                      );
                  break;
                case None():
                  break;
              }
            },
            builder: (context, state) => switch (Theme.of(context).platform) {
              TargetPlatform.macOS => MacosPopupButton<String>(
                  value: state.toNullable(),
                  hint: const Text("Select Instance"),
                  items: instances
                      .map(
                        (e) => MacosPopupMenuItem(
                          value: e.name,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      context.read<InstanceFilterCubit>().changeInstance(value),
                ),
              TargetPlatform.linux => YaruPopupMenuButton(
                  initialValue: state.toNullable(),
                  child: Text(state.fold(
                    () => "Select Instance",
                    (a) => a,
                  )),
                  itemBuilder: (p0) => instances
                      .map(
                        (e) => PopupMenuItem(
                          value: e.name,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onSelected: (value) =>
                      context.read<InstanceFilterCubit>().changeInstance(value),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        InstancesLoadInProgress() => switch (Theme.of(context).platform) {
            TargetPlatform.macOS => const MacosTooltip(
                message: "Loading Instances",
                child: ProgressCircle(),
              ),
            TargetPlatform.linux => const YaruCircularProgressIndicator(),
            _ => const CircularProgressIndicator.adaptive(),
          },
        _ => const SizedBox.shrink(),
      },
    );
  }
}
