import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/models/runtime_error.dart';
import 'package:logger/logger.dart';

/// Data Provider to interact with the IBM Runtime API
class RuntimeDataProvider {
  final Dio _dio;
  final _logger = Logger();

  RuntimeDataProvider({required String accessToken, required Uri baseUrl})
      : _dio = Dio(
          BaseOptions(
            headers: {
              "X-Access-Token": accessToken,
            },
            baseUrl: baseUrl.toString(),
          ),
        );

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
          401 || 500 => switch (Option<List>.safeCast(resp.data['errors'])
                .flatMap((t) => t.traverseOption((a) => Option.fromJson(
                    a, (json) => RuntimeError.fromJson(json))))) {
              Some(value: final d) => throw Exception(d.first.message),
              None() => throw Exception('Failed to parse errors'),
            },
          _ => throw Exception('Failed to get user instances'),
        };
      }, (error, stackTrace) {
        _logger.e('Failed to get user instances',
            error: error, stackTrace: stackTrace);
        return 'Failed to get user instances';
      });
}
