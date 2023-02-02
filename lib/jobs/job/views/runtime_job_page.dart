import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/runtime_bloc.dart';
import '../../model/runtime_data.dart';
import '../widgets/runtime_job_timeline.dart';

class RuntimeJobPage extends StatefulWidget {
  final RuntimeData data;
  const RuntimeJobPage({Key? key, required this.data}) : super(key: key);

  @override
  State<RuntimeJobPage> createState() => _RuntimeJobPageState();
}

class _RuntimeJobPageState extends State<RuntimeJobPage> {
  @override
  void initState() {
    super.initState();
    // context
    //     .read<RuntimeBloc>()
    //     .add(RuntimeResultFetched(jobId: widget.data.job.id));
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.data.job;
    final metrics = widget.data.metrics;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.job.id),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Details",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (metrics.timestamps.finished != null)
                        Column(
                          children: [
                            Text(metrics.timestamps.finished!
                                        .difference(metrics.timestamps.created)
                                        .inSeconds <
                                    1
                                ? "${metrics.timestamps.finished?.difference(metrics.timestamps.created).inMilliseconds.toString()}ms"
                                : "${metrics.timestamps.finished?.difference(metrics.timestamps.created).inSeconds.toString()}s"),
                            Text(
                              "Total completion time",
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      if (job.backend != null)
                        Column(
                          children: [
                            Text(job.backend!),
                            Text(
                              "Compute resource",
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Status"),
                      Text(job.status.name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Provider"),
                      Text("${job.hub}/${job.group}/${job.project}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Program"),
                      Text(job.program),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("# of shots"),
                      Text(job.shots.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("# of circuits"),
                      Text(job.circuits.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          RuntimeJobTimeline(
            timestamps: metrics.timestamps,
          )
        ],
      ),
    );
    // BlocBuilder<RuntimeBloc, RuntimeState>(
    //   builder: (context, state) {
    //     if (state is RuntimeResultInProgress) {
    //       return const Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     }
    //     if (state is RuntimeResultFailure) {
    //       return const Scaffold(
    //         body: Center(
    //           child: Text("Failed to load result"),
    //         ),
    //       );
    //     }
    //     if (state is RuntimeResultSuccess) {
    //       final result = state.result;
    //     }
    //     return Container();
    //   },
    // );
  }
}
