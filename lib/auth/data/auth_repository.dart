import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AuthRepository {
  final AuthDataProvider _authDataProvider;
  final HiveDataProvider _hiveDataProvider;

  AuthRepository({
    required AuthDataProvider authDataProvider,
    required HiveDataProvider hiveDataProvider,
  })  : _authDataProvider = authDataProvider,
        _hiveDataProvider = hiveDataProvider;

  /// Logs in the user using the given token and caches the token and access
  /// token.
  ///
  /// Returns the access token if the login is successful, otherwise returns an
  /// error message.
  TaskEither<String, String> tokenLogin(String token) =>
      TaskEither.tryCatch(() async {
        // TODO: Improve this logic
        final ({
          "id": String accessToken,
          "ttl": int ttl,
          "created": String created
        }) = switch (await _authDataProvider.tokenLogin(token).run()) {
          Left(value: final l) => throw Exception(l),
          Right(value: final r) => r,
        };
        final expiresAt = DateTime.parse(created).add(Duration(seconds: ttl));
        final box = _hiveDataProvider.getBox('ibmq').run().getOrElse(() {
          throw Exception('Box ibmq does not exist');
        });
        await _hiveDataProvider.putAll(box, {
          'token': token,
          'accessToken': accessToken,
          'expiresAt': expiresAt
        });
        return accessToken;
      }, (error, stackTrace) {
        logger.e('Failed to login with token', error: error);
        return 'Failed to login with token';
      });
}
