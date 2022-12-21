import 'dart:developer';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class UserDataProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://auth.quantum-computing.ibm.com/api",
  ));
  final CookieJar cookieJar = CookieJar();

  UserDataProvider() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

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

  Future<Response> getUserData() async {
    try {
      final response = await dio.get('/users/me');
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get user data');
    }
  }
}
