import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/jobs/job/runtime/metrics/model/runtime_job_metrics.dart';
import 'package:ibmq/jobs/job/runtime/model/runtime_job.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository for runtime job endpoints
class RuntimeJobRepository {
  final RuntimeDataProvider _runtimeDataProvider;

  RuntimeJobRepository({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider;

  /// Get Runtime Job information
  ///
  /// [jobId] is the job ID
  ///
  /// Returns the [RuntimeJob] if the request is successful, otherwise
  /// returns an error message.
  ///
  /// See [RuntimeDataProvider.getRuntimeJob] for more details.
  TaskEither<String, RuntimeJob> getRuntimeJob({
    required String jobId,
  }) =>
      _runtimeDataProvider.getRuntimeJob(jobId).flatMap(
            (r) => IOEither.tryCatch(() => RuntimeJob.fromJson(r),
                (error, stackTrace) {
              talker.handle(error, stackTrace, 'Failed to parse runtime job');
              return 'Failed to parse runtime job';
            }).toTaskEither(),
          );

  /// Get job metrics
  ///
  /// [jobId] is the job ID
  ///
  /// Returns the runtime job metrics if the request is successful, otherwise
  /// returns an error message.
  ///
  /// See [RuntimeDataProvider.getRuntimeJobMetrics] for more details.
  TaskEither<String, RuntimeJobMetrics> getJobMetrics({
    required String jobId,
  }) =>
      _runtimeDataProvider.getJobMetrics(jobId).flatMap(
            (r) => IOEither.tryCatch(() => RuntimeJobMetrics.fromJson(r),
                (error, stackTrace) {
              talker.handle(
                  error, stackTrace, 'Failed to parse runtime job metrics');
              return 'Failed to parse runtime job metrics';
            }).toTaskEither(),
          );
}
