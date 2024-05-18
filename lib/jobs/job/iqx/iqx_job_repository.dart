import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/http_data_provider.dart';
import 'package:ibmq/jobs/job/iqx/model/iqx_job.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository for an IQX job
class IQXJobRepository {
  final HTTPDataProvider _httpDataProvider;

  IQXJobRepository({required HTTPDataProvider httpDataProvider})
      : _httpDataProvider = httpDataProvider;

  /// Get IQX Job information
  ///
  /// [jobId] is the job ID
  ///
  /// Returns the [IQXJob] if the request is successful, otherwise
  /// returns an error message.
  ///
  /// See [HTTPDataProvider.getIQXJob] for more details.
  TaskEither<String, IQXJob> getIQXJob(String jobId) => _httpDataProvider
      .getIQXJob(jobId)
      .flatMap(
        (r) => IOEither.tryCatch(() => IQXJob.fromJson(r), (error, stackTrace) {
          talker.handle(error, stackTrace, 'Failed to parse IQX Job');
          return 'Failed to parse IQX Job';
        }).toTaskEither(),
      );
}
