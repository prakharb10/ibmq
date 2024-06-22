import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/models/runtime_api_error.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// Data Provider to interact with the IBM Runtime API
///
/// See [API docs](https://docs.quantum.ibm.com/api/runtime) for more information
class RuntimeDataProvider {
  final Dio _dio;
  final Uri _baseUrl;
  final String _accessToken;

  RuntimeDataProvider({required String accessToken, required Uri baseUrl})
      : _dio = Dio(
          BaseOptions(
            headers: {
              "X-Access-Token": accessToken,
            },
            baseUrl: baseUrl.toString(),
          ),
        )..interceptors.add(
            TalkerDioLogger(
              talker: talker,
              settings: TalkerDioLoggerSettings(
                responseFilter: (response) =>
                    response.realUri.path != '/runtime/facade/v1/jobs',
              ),
            ),
          ),
        _baseUrl = baseUrl,
        _accessToken = accessToken;

  /// Get user instances
  ///
  /// Returns the user instances if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, List> getUserInstances() => TaskEither.tryCatch(() async {
        final resp = await _dio.get('/instances');
        return switch (resp.statusCode) {
          200 => switch (Option<List>.safeCast(resp.data['instances'])) {
              Some(value: final d) => d,
              None() => throw Exception('Failed to parse instances'),
            },
          401 || 500 => switch (
                Option<List>.safeCast(resp.data['errors']).flatMap(
              (t) => t
                  .traverseIOOption(
                    (a) => IOOption.tryCatch(
                      () => RuntimeAPIError.fromJson(a),
                    ),
                  )
                  .run(),
            )) {
              Some(value: final d) => throw Exception(d.first.message),
              None() => throw Exception('Failed to parse errors'),
            },
          _ => throw Exception('Failed to get user instances'),
        };
      }, (error, stackTrace) {
        talker.handle(error, stackTrace, 'Failed to get user instances');
        return 'Failed to get user instances';
      });

  /// List user jobs
  ///
  /// - [provider] is the instance name in the hub/group/project format
  /// - [pending] is a boolean to filter the jobs by pending status
  /// - [backend] is a comma separated string of the backends to filter the jobs
  /// - [sort] is the sort order of the jobs. It can be 'ASC' or 'DESC'
  /// - [limit] is the number of jobs to return
  /// - [offset] is the number of jobs to skip
  /// - [createdAfter] is the date to filter the jobs created after
  /// - [createdBefore] is the date to filter the jobs created before
  /// - [tags] is the list of tags to filter the jobs
  /// - [program] is the program ID to filter the jobs
  /// - [sessionId] is the session ID to filter the jobs
  /// - [composerOnly] is a boolean to filter the jobs by composer only
  /// - [composerFile] is the composer file to filter the jobs
  /// - [search] is the search string to filter the jobs
  ///
  /// Returns the user jobs if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> listUserJobs({
    String? provider,
    bool? pending,
    String? backend,
    String? sort,
    int? limit,
    int? offset,
    String? createdAfter,
    String? createdBefore,
    List<String>? tags,
    String? program,
    String? sessionId,
    bool? composerOnly,
    String? composerFile,
    String? search,
  }) =>
      TaskEither.tryCatch(() async {
        final resp = await _dio.get(
          '/facade/v1/jobs',
          queryParameters: {
            if (provider != null) 'provider': provider,
            if (pending != null) 'pending': pending,
            if (backend != null) 'backend': backend,
            if (sort != null) 'sort': sort,
            if (limit != null) 'limit': limit,
            if (offset != null) 'offset': offset,
            if (createdAfter != null) 'createdAfter': createdAfter,
            if (createdBefore != null) 'createdBefore': createdBefore,
            if (tags != null) 'tags': tags,
            if (program != null) 'program': program,
            if (sessionId != null) 'sessionId': sessionId,
            if (composerOnly != null) 'composerOnly': composerOnly,
            if (composerFile != null) 'composerFile': composerFile,
            if (search != null) 'search': search,
          },
        );
        return switch (resp.statusCode) {
          200 => switch (Option<Map<String, dynamic>>.safeCast(resp.data)) {
              Some(value: final d) => d,
              None() => throw Exception('Failed to parse user jobs'),
            },
          400 || 401 || 403 => switch (
                Option<List>.safeCast(resp.data['errors']).flatMap(
              (t) => t
                  .traverseIOOption(
                    (a) => IOOption.tryCatch(
                      () => RuntimeAPIError.fromJson(a),
                    ),
                  )
                  .run(),
            )) {
              Some(value: final d) => throw Exception(d.first.message),
              None() => throw Exception('Failed to parse errors'),
            },
          _ => throw Exception('Failed to list user jobs'),
        };
      }, (error, stackTrace) {
        talker.handle(error, stackTrace, 'Failed to list user jobs');
        return 'Failed to list user jobs';
      });

  /// Get Runtime Job information
  ///
  /// [jobId] is the job ID
  ///
  /// Returns the Runtime Job information if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> getRuntimeJob(String jobId) =>
      TaskEither.tryCatch(() async {
        final resp = await _dio.get('/jobs/$jobId');
        return switch (resp.statusCode) {
          200 => switch (Option<Map<String, dynamic>>.safeCast(resp.data)) {
              Some(value: final d) => d,
              None() => throw Exception('Failed to parse runtime job'),
            },
          401 || 404 || 500 => switch (
                Option<List>.safeCast(resp.data['errors']).flatMap(
              (t) => t
                  .traverseIOOption(
                    (a) => IOOption.tryCatch(
                      () => RuntimeAPIError.fromJson(a),
                    ),
                  )
                  .run(),
            )) {
              Some(value: final d) => throw Exception(d.first.message),
              None() => throw Exception('Failed to parse errors'),
            },
          _ => throw Exception('Failed to get runtime job'),
        };
      }, (error, stackTrace) {
        talker.handle(error, stackTrace, 'Failed to get runtime job');
        return 'Failed to get runtime job';
      });

  /// Get job metrics
  ///
  /// [jobId] is the job ID
  ///
  /// Returns the API response if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> getJobMetrics(String jobId) =>
      TaskEither.tryCatch(() async {
        final resp = await _dio.get('/jobs/$jobId/metrics');
        return switch (resp.statusCode) {
          200 => switch (Option<Map<String, dynamic>>.safeCast(resp.data)) {
              Some(value: final d) => d,
              None() => throw Exception('Failed to parse job metrics'),
            },
          401 || 403 || 404 => switch (
                Option<List>.safeCast(resp.data['errors']).flatMap(
              (t) => t
                  .traverseIOOption(
                    (a) => IOOption.tryCatch(
                      () => RuntimeAPIError.fromJson(a),
                    ),
                  )
                  .run(),
            )) {
              Some(value: final d) => throw Exception(d.first.message),
              None() => throw Exception('Failed to parse errors'),
            },
          _ => throw Exception('Failed to get job metrics'),
        };
      }, (error, stackTrace) {
        talker.handle(error, stackTrace, 'Failed to get job metrics');
        return 'Failed to get job metrics';
      });

  /// Get usage for all instances
  ///
  /// Returns the API response if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> getUsage() => TaskEither.tryCatch(
        () async {
          final resp = await _dio.get('/usage');
          return switch (resp.statusCode) {
            200 => switch (Option<Map<String, dynamic>>.safeCast(resp.data)) {
                Some(value: final d) => d,
                None() => throw Exception('Failed to cast usage data'),
              },
            401 || 500 => switch (
                  Option<List>.safeCast(resp.data['errors']).flatMap(
                (t) => t
                    .traverseIOOption(
                      (a) => IOOption.tryCatch(
                        () => RuntimeAPIError.fromJson(a),
                      ),
                    )
                    .run(),
              )) {
                Some(value: final d) => throw Exception(d.first.message),
                None() => throw Exception('Failed to parse errors'),
              },
            _ => throw Exception('Failed to get usage data'),
          };
        },
        (error, stackTrace) {
          talker.handle(error, stackTrace, 'Failed to get usage data');
          return 'Failed to get usage data';
        },
      );

  /// Get user jobs state updates
  ///
  /// Returns the user jobs state updates if the request is successful, otherwise
  /// returns an error message.
  ///
  /// The user jobs state updates are returned as a stream of messages.
  TaskEither<String, Stream> getUserJobsStateUpdates() =>
      TaskEither.tryCatch(() async {
        final socket = WebSocket(_baseUrl.replace(
          scheme: 'wss',
          path: '/runtime/stream/jobs',
        ));
        await socket.connection.firstWhere((state) => state is Connected);

        // Send the access token to authenticate the user
        socket.send('{"X-Access-Token": "$_accessToken"}');
        return socket.messages;
      }, (error, stackTrace) {
        talker.handle(
            error, stackTrace, 'Failed to get user job state updates');
        return 'Failed to get user job state updates';
      });
}
