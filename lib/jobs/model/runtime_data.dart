import 'package:ibmq/jobs/model/job.dart';
// import 'package:ibmq/jobs/model/runtime_job.dart';
import 'package:ibmq/jobs/job/runtime/metrics/model/runtime_job_metrics.dart';

/// The runtime data
///
/// This is a wrapper class for the [RuntimeJob] and [RuntimeJobMetrics]
/// classes.
/// Used to pass the data to the [RuntimeJobPage].
class RuntimeData extends BaseJob {
  /// The job data
  // final RuntimeJob job;

  /// The job metrics
  final RuntimeJobMetrics metrics;

  const RuntimeData({
    // required this.job,
    required this.metrics,
  });

  @override
  List<Object> get props => [metrics];
}
