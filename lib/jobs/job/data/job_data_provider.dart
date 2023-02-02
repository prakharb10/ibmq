import 'dart:developer';

import 'package:dio/dio.dart';

class JobDataProvider {
  final Dio dio;

  JobDataProvider(this.dio);

  Future<Response> getJobInfo(String jobId) async {
    try {
      final response = await dio.get('/jobs/$jobId');
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job info');
    }
  }
}
