import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:ibmq/jobs/job/runtime/metrics/cubit/runtime_job_metrics_cubit.dart';
import 'package:ibmq/jobs/job/runtime/model/runtime_job.dart';
import 'package:ibmq/jobs/job/runtime/widgets/runtime_job_timeline.dart';
import 'package:macos_ui/macos_ui.dart';

class RuntimeJobDetails extends StatefulWidget {
  final RuntimeJob job;
  const RuntimeJobDetails({super.key, required this.job});

  @override
  State<RuntimeJobDetails> createState() => _RuntimeJobDetailsState();
}

class _RuntimeJobDetailsState extends State<RuntimeJobDetails> {
  @override
  void initState() {
    super.initState();
    context.read<RuntimeJobMetricsCubit>().loadMetrics(widget.job.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Details",
                  style: MacosTheme.of(context).typography.title2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          if (widget.job.ended case Some(:final value))
                            Column(
                              children: [
                                Text(
                                    "${value.difference(widget.job.created).inSeconds.toString()}s"),
                                Text(
                                  "Total completion time",
                                  style: MacosTheme.of(context)
                                      .typography
                                      .caption1,
                                )
                              ],
                            ),
                          Column(
                            children: [
                              Text(widget.job.backend),
                              Text(
                                "Compute resource",
                                style:
                                    MacosTheme.of(context).typography.caption1,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        primary: false,
                        childAspectRatio: 9,
                        padding: const EdgeInsets.all(8),
                        children: [
                          const Text("Status"),
                          Text(widget.job.status.name),
                          const Text("Instance"),
                          Text(
                              "${widget.job.hub}/${widget.job.group}/${widget.job.project}"),
                          const Text("Program"),
                          Text(widget.job.program.id),
                          const Text("# of shots"),
                          Text(widget.job.params.shots.toString()),
                          const Text("# of circuits"),
                          Text(widget.job.params.circuits.length.toString()),
                        ],
                      ),
                    ),
                    Flexible(
                      child: BlocBuilder<RuntimeJobMetricsCubit,
                          RuntimeJobMetricsState>(
                        builder: (context, state) => switch (state) {
                          LoadInProgress() => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          LoadFailure(:final error) => Tooltip(
                              message: error,
                              child: switch (Theme.of(context).platform) {
                                TargetPlatform.macOS => const MacosIcon(
                                    CupertinoIcons.exclamationmark_triangle,
                                    color: MacosColors.systemRedColor,
                                  ),
                                _ => const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                              },
                            ),
                          LoadSuccess(:final metrics) =>
                            RuntimeJobTimeline(metrics: metrics),
                          _ => const Text(''),
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
