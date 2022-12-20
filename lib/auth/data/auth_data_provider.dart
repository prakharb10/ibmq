import 'dart:developer';

import 'package:dio/dio.dart';

class AuthDataProvider {
  final Dio dio;

  AuthDataProvider(this.dio);

  Future<Response> tokenLogin(String token) async {
    try {
      final response = await dio.post(
        '/users/loginWithToken',
        data: {'apiToken': token},
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login with token');
    }
  }
}
