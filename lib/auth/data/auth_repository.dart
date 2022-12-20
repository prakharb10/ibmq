import 'dart:developer';
import 'dart:io';

import 'auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<Cookie> tokenLogin(String token) async {
    try {
      final resp = await authDataProvider.tokenLogin(token);
      log(resp.toString());
      final cookie = Cookie.fromSetCookieValue(resp.headers['set-cookie']![0]);
      return cookie;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login with token');
    }
  }
}
