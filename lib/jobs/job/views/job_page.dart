import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/job/cubit/job_cubit.dart';
import 'package:ibmq/jobs/job/widgets/job_timeline.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jobId),
      ),
      body: BlocBuilder<JobCubit, JobState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is JobLoadFailed) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is JobLoaded) {
            final job = state.job;
            return ListView(
              children: [
                if (job.infoQueue != null)
                  Column(
                    children: [
                      Text("Position in queue: ${job.infoQueue!.position}"),
                      Text(
                          "Estimated start time: ${DateFormat.yMMMd().add_jm().format(job.infoQueue!.estimatedStartTime.toLocal())}"),
                      Text(
                          "Estimated completion time: ${DateFormat.yMMMd().add_jm().format(job.infoQueue!.estimatedCompleteTime.toLocal())}"),
                    ],
                  ),
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
                            if (job.timePerStep.completed != null)
                              Column(
                                children: [
                                  Text(
                                      "${job.timePerStep.completed?.difference(job.timePerStep.creating!).inSeconds.toString()}s"),
                                  Text(
                                    "Total completion time",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                            Column(
                              children: [
                                Text(job.backend.name),
                                Text(
                                  "Compute resource",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                        if (job.timePerStep.queued != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Sent to queue"),
                              Text(
                                DateFormat.yMMMd()
                                    .add_jm()
                                    .format(job.timePerStep.queued!.toLocal()),
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
                            Text(
                                job.summaryData.summary.numCircuits.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                JobTimeline(
                  timePerStep: job.timePerStep,
                  resultTime: job.summaryData.resultTime,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
