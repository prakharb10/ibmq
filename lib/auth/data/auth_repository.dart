import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AuthRepository {
  final AuthClient _authClient;
  final HiveDataProvider _hiveDataProvider;

  AuthRepository({
    required AuthClient authClient,
    required HiveDataProvider hiveDataProvider,
  })  : _authClient = authClient,
        _hiveDataProvider = hiveDataProvider;

  /// Logs in the user using the given token and caches the token and access
  /// token.
  ///
  /// Returns the access token if the login is successful, otherwise returns an
  /// error message.
  TaskEither<String, String> tokenLogin(String token) => TaskEither(() async {
        try {
          final resp = await _authClient.tokenLogin({'apiToken': token});
          final ({
            "id": String accessToken,
            "ttl": int ttl,
            "created": String created
          }) = resp.data as Map<String, dynamic>;
          final expiresAt = DateTime.parse(created).add(Duration(seconds: ttl));
          final box = _hiveDataProvider.getBox('ibmq');
          await _hiveDataProvider.putAll(box, {
            'token': token,
            'accessToken': accessToken,
            'expiresAt': expiresAt
          });
          return Right(accessToken);
        } catch (e) {
          logger.e('Failed to login with token', error: e);
          return const Left('Failed to login with token');
        }
      });
}
