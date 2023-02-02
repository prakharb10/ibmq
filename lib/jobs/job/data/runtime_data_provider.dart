import 'dart:developer';

import 'package:dio/dio.dart';

class RuntimeDataProvider {
  final Dio runtimeDio;

  RuntimeDataProvider(this.runtimeDio);

  Future<Response> getJobResults(String jobId) async {
    try {
      final response = await runtimeDio.get('/jobs/$jobId/results');
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job results');
    }
  }
}
