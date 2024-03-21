import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/jobs/model/user_jobs.dart';
import 'package:logger/logger.dart';

/// Repository for user jobs
class JobsRepository {
  final RuntimeDataProvider _runtimeDataProvider;
  // TODO: Add talker
  final _logger = Logger();

  JobsRepository({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider;

  /// List user jobs
  ///
  /// - [provider] is the instance name in the hub/group/project format
  /// - [pending] is a boolean to filter the jobs by pending status
  /// - [backend] is a list of the backends to filter the jobs
  /// - [sort] is the sort order of the jobs. It can be 'ASC' or 'DESC'
  /// - [limit] is the number of jobs to return
  /// - [offset] is the number of jobs to skip
  /// - [createdAfter] is the date to filter the jobs created after
  /// - [createdBefore] is the date to filter the jobs created before
  /// - [tags] is the list of tags to filter the jobs
  /// - [program] is the program ID to filter the jobs
  /// - [sessionId] is the session ID to filter the jobs
  /// - [search] is the search string to filter the jobs
  ///
  /// Returns the user jobs if the request is successful, otherwise
  /// returns an error message.
  ///
  /// See [RuntimeDataProvider.listUserJobs] for more details.
  TaskEither<String, UserJobs> listUserJobs({
    Option<String> provider = const Option.none(),
    Option<bool> pending = const Option.none(),
    Option<List<String>> backend = const Option.none(),
    Option<String> sort = const Option.none(),
    Option<int> limit = const Option.none(),
    Option<int> offset = const Option.none(),
    Option<String> createdAfter = const Option.none(),
    Option<String> createdBefore = const Option.none(),
    Option<List<String>> tags = const Option.none(),
    Option<String> program = const Option.none(),
    Option<String> sessionId = const Option.none(),
    Option<String> search = const Option.none(),
  }) =>
      _runtimeDataProvider
          .listUserJobs(
            provider: provider.toNullable(),
            pending: pending.toNullable(),
            backend: backend.map((t) => t.join(',')).toNullable(),
            sort: sort.toNullable(),
            limit: limit.toNullable(),
            offset: offset.toNullable(),
            createdAfter: createdAfter.toNullable(),
            createdBefore: createdBefore.toNullable(),
            tags: tags.toNullable(),
            program: program.toNullable(),
            sessionId: sessionId.toNullable(),
            search: search.toNullable(),
          )
          .flatMap(
            (r) => IOEither.tryCatch(() => UserJobs.fromJson(r),
                (error, stackTrace) {
              _logger.e('Failed to parse user jobs',
                  error: error, stackTrace: stackTrace);
              return 'Failed to parse user jobs';
            }).toTaskEither(),
          );
}
