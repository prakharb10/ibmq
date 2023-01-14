import 'package:flutter/material.dart';
import 'package:ibmq/jobs/job/model/job.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class JobTimeline extends StatelessWidget {
  final TimePerStep timePerStep;
  final double? resultTime;
  const JobTimeline({
    super.key,
    required this.timePerStep,
    this.resultTime,
  });

  @override
  Widget build(BuildContext context) {
    return FixedTimeline(
      theme: TimelineThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      children: [
        if (timePerStep.creating != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Created: ${DateFormat.yMMMd().add_jm().format(timePerStep.creating!.toLocal())}",
            ),
          ),
        if (timePerStep.transpiling != null && timePerStep.transpiled != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Transpiled: ${timePerStep.transpiled!.difference(timePerStep.transpiling!).inMilliseconds}ms",
            ),
          ),
        if (timePerStep.transpiling == null &&
            timePerStep.transpiled == null &&
            timePerStep.validating != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: const Text("Transpiled"),
          ),
        if (timePerStep.validating != null && timePerStep.validated != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Validated: ${timePerStep.validated!.difference(timePerStep.validating!).inMilliseconds}ms",
            ),
          ),
        if (timePerStep.queued != null && timePerStep.running == null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const CircularProgressIndicator(),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: const Text("Queued"),
          ),
        if (timePerStep.queued != null && timePerStep.running != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "In queue: ${timePerStep.running!.difference(timePerStep.queued!).inSeconds}s",
            ),
          ),
        if (timePerStep.running != null && resultTime == null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: const Text("Running"),
          ),
        if (resultTime != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Running: ${resultTime!.toStringAsFixed(2)}s",
            ),
          ),
        if (timePerStep.completed != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Completed: ${DateFormat.yMMMd().add_jm().format(timePerStep.completed!.toLocal())}",
            ),
          ),
      ],
    );
  }
}
