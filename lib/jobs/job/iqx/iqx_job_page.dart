import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/job/iqx/cubit/iqx_job_cubit.dart';
import 'package:ibmq/jobs/job/iqx/widgets/iqx_job_details.dart';
import 'package:macos_ui/macos_ui.dart';

class IQXJobPage extends StatefulWidget {
  final String jobId;
  final ScrollController? scrollController;
  const IQXJobPage({super.key, required this.jobId, this.scrollController});

  @override
  State<IQXJobPage> createState() => _IQXJobPageState();
}

class _IQXJobPageState extends State<IQXJobPage> {
  @override
  void initState() {
    super.initState();
    context.read<IqxJobCubit>().getIQXJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<IqxJobCubit, IqxJobState>(
        builder: (context, state) {
          return switch (state) {
            Success(:final job) => switch (Theme.of(context).platform) {
                TargetPlatform.macOS => SingleChildScrollView(
                    controller: widget.scrollController,
                    padding: const EdgeInsets.all(16),
                    child: IQXJobDetails(job: job),
                  ),
                _ => Center(
                    child: Text(job.userId),
                  ),
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
