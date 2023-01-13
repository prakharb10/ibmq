import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/job/cubit/job_cubit.dart';
import 'package:intl/intl.dart';

class JobPage extends StatefulWidget {
  final String jobId;
  const JobPage({Key? key, required this.jobId}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  void initState() {
    super.initState();
    context.read<JobCubit>().getJobInfo(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobCubit, JobState>(
      builder: (context, state) {
        if (state is JobLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is JobLoadFailed) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        if (state is JobLoaded) {
          final job = state.job;
          return Scaffold(
            appBar: AppBar(
              title: Text(job.id),
            ),
            body: Card(
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
                        Column(
                          children: [
                            Text(
                                "${job.timePerStep.completed.difference(job.timePerStep.creating).inSeconds.toString()}s"),
                            Text(
                              "Total completion time",
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(job.backend.name),
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
                        const Text("Created on"),
                        Text(
                          DateFormat.yMMMd()
                              .add_jm()
                              .format(job.creationDate.toLocal()),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Sent to queue"),
                        Text(
                          DateFormat.yMMMd()
                              .add_jm()
                              .format(job.timePerStep.queued.toLocal()),
                        ),
                      ],
                    ),
                    if (job.runMode != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Run Mode"),
                          Text(job.runMode!),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("# of shots"),
                        Text(job.summaryData.summary.qobjConfig.shots
                            .toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("# of circuits"),
                        Text(job.summaryData.summary.numCircuits.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}