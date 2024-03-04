import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

/// Data provider for authentication
class AuthDataProvider {
  final _dio = Dio(BaseOptions(
    baseUrl: 'https://auth.quantum-computing.ibm.com/api',
  ));

  final _logger = Logger();

  /// Logs in the user using the given token
  ///
  /// Returns the user's login information if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> tokenLogin(String token) =>
      TaskEither.tryCatch(
        () async {
          final resp = await _dio.post(
            '/users/loginWithToken',
            data: {'apiToken': token},
          );
          final data = Option<Map<String, dynamic>>.safeCast(resp.data);
          return switch (data) {
            Some(value: final d) => d,
            None() => throw Exception('Failed to parse response data'),
          };
        },
        (error, stackTrace) {
          _logger.e('Failed to login with token', error: error);
          return 'Failed to login with token';
        },
      );

  /// Gets the user's information using the given access token
  ///
  /// Returns the user's information if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, Map<String, dynamic>> getUser(String accessToken) =>
      TaskEither.tryCatch(
        () async {
          final resp = await _dio.get(
            '/users/me',
            options: Options(headers: {'X-Access-Token': accessToken}),
          );
          final data = Option<Map<String, dynamic>>.safeCast(resp.data);
          return switch (data) {
            Some(value: final d) => d,
            None() => throw Exception('Failed to parse response data'),
          };
        },
        (error, stackTrace) {
          _logger.e('Failed to get user', error: error);
          return 'Failed to get user';
        },
      );

  /// Gets the version of the authentication service
  ///
  /// Returns the version if the request is successful, otherwise returns an error
  /// message.
  TaskEither<String, Map<String, dynamic>> getVersion() => TaskEither.tryCatch(
        () async {
          final resp = await _dio.get('/version');
          final data = Option<Map<String, dynamic>>.safeCast(resp.data);
          return switch (data) {
            Some(value: final d) => d,
            None() => throw Exception('Failed to parse response data'),
          };
        },
        (error, stackTrace) {
          _logger.e('Failed to get version', error: error);
          return 'Failed to get version';
        },
      );
}
