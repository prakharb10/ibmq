import 'dart:developer';
import 'dart:io';

import 'package:ibmq/user/data/user_data_provider.dart';

import '../model/user.dart';

class UserRepository {
  final UserDataProvider userDataProvider = UserDataProvider();

  Future<Set> tokenLogin(String token) async {
    try {
      final resp = await userDataProvider.tokenLogin(token);
      final cookie = Cookie.fromSetCookieValue(resp.headers['set-cookie']![0]);
      final accessToken = resp.data['id'] as String;
      return {cookie, accessToken};
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login with token');
    }
  }

  Future<User> getProfile() async {
    try {
      final resp = await userDataProvider.getUserData();
      final user = User.fromJson(resp.data);
      return user;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get user data');
    }
  }
}
