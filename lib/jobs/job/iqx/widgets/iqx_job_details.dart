import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/job/iqx/model/iqx_job.dart';
import 'package:ibmq/jobs/job/iqx/widgets/job_timeline.dart';
import 'package:intl/intl.dart';
import 'package:macos_ui/macos_ui.dart';

class IQXJobDetails extends StatelessWidget {
  final IQXJob job;
  const IQXJobDetails({super.key, required this.job});

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
                          if (job.timePerStep.completed case Some(:final value))
                            Column(
                              children: [
                                Text(
                                    "${value.difference(job.timePerStep.creating).inSeconds.toString()}s"),
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
                              Text(job.backend.name),
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
                          const Text("Created on"),
                          Text(
                            DateFormat.yMMMd()
                                .add_jm()
                                .format(job.creationDate.toLocal()),
                          ),
                          if (job.timePerStep.queued
                              case Some(:final value)) ...[
                            const Text("Sent to queue"),
                            Text(
                              DateFormat.yMMMd()
                                  .add_jm()
                                  .format(value.toLocal()),
                            ),
                          ],
                          if (job.runMode case Some(:final value)) ...[
                            const Text("Run Mode"),
                            Text(value.name),
                          ],
                          const Text("# of shots"),
                          Text(job.summaryData.summary.qobjConfig.shots
                              .toString()),
                          const Text("# of circuits"),
                          Text(job.summaryData.summary.numCircuits.toString()),
                        ],
                      ),
                    ),
                    Flexible(
                      child: JobTimeline(
                        timePerStep: job.timePerStep,
                        resultTime: job.summaryData.resultTime,
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
