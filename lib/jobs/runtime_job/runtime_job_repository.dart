import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/jobs/runtime_job/metrics/model/runtime_job_metrics.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository for runtime job endpoints
class RuntimeJobRepository {
  final RuntimeDataProvider _runtimeDataProvider;

  RuntimeJobRepository({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider;

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
