import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/job/iqx/model/iqx_job.dart';
import 'package:ibmq/jobs/job/iqx/widgets/job_timeline.dart';
import 'package:intl/intl.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

//TODO: Refactor this and RuntimeJobDetails to a common widget
class IQXJobDetails extends StatelessWidget {
  final IQXJob job;
  const IQXJobDetails({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Details",
          style: switch (Theme.of(context).platform) {
            TargetPlatform.macOS => MacosTheme.of(context).typography.title2,
            TargetPlatform.windows =>
              fluent.FluentTheme.of(context).typography.title,
            _ => Theme.of(context).textTheme.titleMedium,
          },
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
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.macOS =>
                              MacosTheme.of(context).typography.caption1,
                            TargetPlatform.windows =>
                              fluent.FluentTheme.of(context).typography.caption,
                            _ => Theme.of(context).textTheme.labelMedium,
                          },
                        )
                      ],
                    ),
                  Column(
                    children: [
                      Text(job.backend.name),
                      Text(
                        "Compute resource",
                        style: switch (Theme.of(context).platform) {
                          TargetPlatform.macOS =>
                            MacosTheme.of(context).typography.caption1,
                          TargetPlatform.windows =>
                            fluent.FluentTheme.of(context).typography.caption,
                          _ => Theme.of(context).textTheme.labelMedium,
                        },
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
                  if (job.timePerStep.queued case Some(:final value)) ...[
                    const Text("Sent to queue"),
                    Text(
                      DateFormat.yMMMd().add_jm().format(value.toLocal()),
                    ),
                  ],
                  if (job.runMode case Some(:final value)) ...[
                    const Text("Run Mode"),
                    Text(value.name),
                  ],
                  const Text("# of shots"),
                  Text(job.summaryData.summary.qobjConfig.shots.toString()),
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
    );
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: column,
          ),
        ),
      TargetPlatform.linux => YaruSection(child: column),
      TargetPlatform.windows => fluent.Card(
          padding: const EdgeInsets.all(16.0),
          child: column,
        ),
      _ => Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: column,
          ),
        ),
    };
  }
}
