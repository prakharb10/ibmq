import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/job/runtime/metrics/model/runtime_job_metrics.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class RuntimeJobTimeline extends StatelessWidget {
  final RuntimeJobMetrics metrics;
  const RuntimeJobTimeline({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return FixedTimeline(
      theme: TimelineThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
      children: [
        TimelineTile(
          node: TimelineNode.simple(
            indicatorChild: Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            drawStartConnector: false,
          ),
          contents: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
            child: Text(
              DateFormat.yMMMd()
                  .add_jm()
                  .format(metrics.timestamps.created.toLocal()),
            ),
          ),
          oppositeContents: const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Text(
              "Created",
            ),
          ),
        ),
        ...switch (metrics.timestamps.running) {
          None() => [
              TimelineTile(
                node: TimelineNode.simple(
                  indicatorChild: const CircularProgressIndicator(),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                oppositeContents: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Text(
                    "In queue",
                  ),
                ),
              )
            ],
          Some(:final value) => [
              TimelineTile(
                node: TimelineNode.simple(
                  indicatorChild: Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                contents: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                  child: Text(
                    "${value.difference(metrics.timestamps.created).inSeconds.toString()}s",
                  ),
                ),
                oppositeContents: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Text(
                    "In queue",
                  ),
                ),
              ),
              TimelineTile(
                node: TimelineNode.simple(
                  indicatorChild: Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                contents: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                  child: Text(
                    DateFormat.yMMMd().add_jm().format(value.toLocal()),
                  ),
                ),
                oppositeContents: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Text(
                    "Running",
                  ),
                ),
              ),
            ]
        },
        if (metrics.timestamps.finished case Some(:final value))
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              drawEndConnector: false,
            ),
            contents: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
              child: Text(
                DateFormat.yMMMd().add_jm().format(value.toLocal()),
              ),
            ),
            oppositeContents: const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Text(
                "Completed",
              ),
            ),
          ),
      ],
    );
  }
}
