import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/job/runtime/bloc/runtime_job_bloc.dart';
import 'package:ibmq/jobs/job/runtime/metrics/cubit/runtime_job_metrics_cubit.dart';
import 'package:ibmq/jobs/job/runtime/model/runtime_job.dart';
import 'package:ibmq/jobs/job/runtime/runtime_job_repository.dart';
import 'package:ibmq/jobs/job/runtime/widgets/runtime_job_details.dart';
import 'package:macos_ui/macos_ui.dart';

class RuntimeJobPage extends StatefulWidget {
  final String jobId;
  final ScrollController? scrollController;
  const RuntimeJobPage({
    super.key,
    required this.jobId,
    this.scrollController,
  });

  @override
  State<RuntimeJobPage> createState() => _RuntimeJobPageState();
}

class _RuntimeJobPageState extends State<RuntimeJobPage> {
  @override
  void initState() {
    super.initState();
    context.read<RuntimeJobBloc>().add(RuntimeJobEvent.loaded(widget.jobId));
    // context
    //     .read<RuntimeBloc>()
    //     .add(RuntimeResultFetched(jobId: widget.data.job.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RuntimeJobBloc, RuntimeJobState>(
      builder: (context, state) {
        return switch (state) {
          Success(:final job) => switch (Theme.of(context).platform) {
              TargetPlatform.macOS => SingleChildScrollView(
                  controller: widget.scrollController,
                  padding: const EdgeInsets.all(16),
                  child: child(job),
                ),
              TargetPlatform.linux => SingleChildScrollView(
                  controller: widget.scrollController,
                  padding: const EdgeInsets.all(16),
                  child: child(job),
                ),
              _ => child(job),
              // ListView(
              //     children: [
              // BlocBuilder<RuntimeBloc, RuntimeState>(
              //   builder: (context, state) {
              //     if (state is RuntimeResultInProgress) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     if (state is RuntimeResultFailure) {
              //       return const Center(
              //         child: Text("Failed to load result"),
              //       );
              //     }
              //     if (state is RuntimeResultSuccess<EstimatorResult>) {
              //       final result = state.result;
              //       return Card(
              //         margin: const EdgeInsets.all(8),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text(
              //                 "Results",
              //                 style: Theme.of(context).textTheme.titleLarge,
              //               ),
              //               ResultsSection(
              //                 name: "metadata",
              //                 type: "array",
              //                 description: "Additional metadata",
              //                 content: const JsonEncoder.withIndent('  ').convert(
              //                   result.metadata,
              //                 ),
              //               ),
              //               const Divider(),
              //               ResultsSection(
              //                 name: "values",
              //                 type: "array",
              //                 description:
              //                     """Estimated expectation values <Ψ|H|Ψ>. This is a numpy array. The i-th element is calculated using the circuit and observable indexed by the i-th circuit_indices and i-th observable_indices, and bound with i-th parameter_values.""",
              //                 content: const JsonEncoder.withIndent('  ').convert(
              //                   result.values,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     }
              //     if (state is RuntimeResultSuccess<SamplerResult>) {
              //       final result = state.result;
              //       return Card(
              //         margin: const EdgeInsets.all(8),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text(
              //                 "Results",
              //                 style: Theme.of(context).textTheme.titleLarge,
              //               ),
              //               ResultsSection(
              //                 name: "metadata",
              //                 type: "array",
              //                 description: "Additional metadata",
              //                 content: const JsonEncoder.withIndent('  ').convert(
              //                   result.metadata,
              //                 ),
              //               ),
              //               const Divider(),
              //               ResultsSection(
              //                 name: "quasi_dists",
              //                 type: "array",
              //                 description:
              //                     "List of quasi-probabilities returned for each circuit",
              //                 content: const JsonEncoder.withIndent('  ').convert(
              //                   result.quasiDists,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     }
              //     return Container();
              //   },
              // )
              //   ],
              // )
            },
          Failure(:final message) => Center(
              child: Text(message),
            ),
          Loading() => switch (Theme.of(context).platform) {
              TargetPlatform.macOS => const Center(
                  child: ProgressCircle(),
                ),
              _ => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
            },
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  BlocProvider<RuntimeJobMetricsCubit> child(RuntimeJob job) {
    return BlocProvider(
      create: (context) => RuntimeJobMetricsCubit(
          runtimeJobRepository:
              RepositoryProvider.of<RuntimeJobRepository>(context)),
      child: RuntimeJobDetails(job: job),
    );
  }
}
