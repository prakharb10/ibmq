import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/job/iqx/model/iqx_job.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class JobTimeline extends StatelessWidget {
  final TimePerStep timePerStep;
  final Option<double> resultTime;
  const JobTimeline({
    super.key,
    required this.timePerStep,
    required this.resultTime,
  });

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
                  .format(timePerStep.creating.toLocal()),
            ),
          ),
          oppositeContents: const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Text(
              "Created",
            ),
          ),
        ),
        switch ((timePerStep.transpiling, timePerStep.transpiled)) {
          (Some(value: final transpiling), Some(value: final transpiled)) =>
            TimelineTile(
              node: TimelineNode.simple(
                indicatorChild: Icon(Icons.check,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              contents: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: Text(
                  "${transpiled.difference(transpiling).inMilliseconds}ms",
                ),
              ),
              oppositeContents: const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Text("Transpiled"),
              ),
            ),
          (None(), None()) => switch (timePerStep.validating) {
              Some() => TimelineTile(
                  node: TimelineNode.simple(
                    indicatorChild: Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  oppositeContents: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Text("Transpiled"),
                  ),
                ),
              None() => const SizedBox.shrink(),
            },
          _ => const SizedBox.shrink(),
        },
        switch ((timePerStep.validating, timePerStep.validated)) {
          (Some(value: final validating), Some(value: final validated)) =>
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
                  "${validated.difference(validating).inMilliseconds}ms",
                ),
              ),
              oppositeContents: const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Text("Validated"),
              ),
            ),
          _ => const SizedBox.shrink(),
        },
        switch ((timePerStep.queued, timePerStep.running)) {
          (Some(), None()) => TimelineTile(
              node: TimelineNode.simple(
                indicatorChild: const CircularProgressIndicator.adaptive(),
              ),
              oppositeContents: const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Text("Queued"),
              ),
            ),
          (Some(value: final queued), Some(value: final running)) =>
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
                  "${running.difference(queued).inSeconds}s",
                ),
              ),
              oppositeContents: const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Text("In queue"),
              ),
            ),
          _ => const SizedBox.shrink(),
        },
        if (timePerStep.running is None && resultTime is None)
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            oppositeContents: const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Text("Running"),
            ),
          ),
        if (resultTime case Some(:final value))
          TimelineTile(
            node: TimelineNode.simple(
              indicatorChild: Icon(Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            contents: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
              child: Text(
                "${value.toStringAsFixed(2)}s",
              ),
            ),
            oppositeContents: const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: Text("Running"),
            ),
          ),
        if (timePerStep.completed case Some(:final value))
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
              child: Text("Completed"),
            ),
          ),
      ],
    );
  }
}
