import 'package:flutter/material.dart';
import 'package:ibmq/jobs/model/runtime_job_metrics.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class RuntimeJobTimeline extends StatelessWidget {
  final RuntimeJobTimestamps timestamps;
  const RuntimeJobTimeline({Key? key, required this.timestamps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedTimeline(
      theme: TimelineThemeData(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      children: [
        TimelineTile(
          node: TimelineNode.simple(
            indicatorChild: const Icon(Icons.check),
          ),
          nodeAlign: TimelineNodeAlign.start,
          contents: Text(
            "Created: ${DateFormat.yMMMd().add_jm().format(timestamps.created.toLocal())}",
          ),
        ),
        if (timestamps.running == null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const CircularProgressIndicator(),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: const Text("Queued"),
          ),
        if (timestamps.running != null) ...[
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "In queue: ${timestamps.running!.difference(timestamps.created).inSeconds}s",
            ),
          ),
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Running: ${DateFormat.yMMMd().add_jm().format(timestamps.running!.toLocal())}",
            ),
          ),
        ],
        if (timestamps.finished != null)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: const Icon(Icons.check),
            ),
            nodeAlign: TimelineNodeAlign.start,
            contents: Text(
              "Completed: ${DateFormat.yMMMd().add_jm().format(timestamps.finished!.toLocal())}",
            ),
          ),
      ],
    );
  }
}
