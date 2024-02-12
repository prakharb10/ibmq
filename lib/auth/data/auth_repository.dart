import 'package:ibmq/data/auth_client.dart';
import 'package:ibmq/data/hive_data_provider.dart';

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
  /// Returns the access token.
  ///
  /// Throws an exception if an error occurs.
  Future<String> tokenLogin(String token) async {
    try {
      final resp = await _authClient.tokenLogin({'apiToken': token});
      final ({
        "id": String accessToken,
        "ttl": int ttl,
        "created": String created
      }) = resp.data as Map<String, dynamic>;
      final expiresAt = DateTime.parse(created).add(Duration(seconds: ttl));
      final box = _hiveDataProvider.getBox('ibmq');
      await _hiveDataProvider.putAll(box,
          {'token': token, 'accessToken': accessToken, 'expiresAt': expiresAt});
      return accessToken;
    } catch (e) {
      throw Exception('Failed to login with token');
    }
  }
}
