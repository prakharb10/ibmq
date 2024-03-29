import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

/// Data Provider to interact with the HTTP API
class HTTPDataProvider {
  final Dio _dio;

  HTTPDataProvider({required String accessToken, required Uri baseUrl})
      : _dio = Dio(
          BaseOptions(
            headers: {
              "X-Access-Token": accessToken,
            },
            baseUrl: baseUrl.toString(),
          ),
        )..interceptors.add(TalkerDioLogger(talker: talker));

  /// Get the H/G/P information
  ///
  /// Returns the H/G/P information if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, List> getHGP() => TaskEither.tryCatch(
        () async {
          final resp = await _dio.get('/Network');
          return switch (Option<List>.safeCast(resp.data)) {
            Some(value: final d) => d,
            None() => throw Exception('Failed to parse response data'),
          };
        },
        (error, stackTrace) {
          talker.handle(error, stackTrace, 'Failed to get H/G/P information');
          return 'Failed to get H/G/P information';
        },
      );
}
