import 'dart:developer';

import 'package:dio/dio.dart';

class JobsDataProvider {
  final Dio _dio;

  JobsDataProvider(this._dio);

  Future<Response> getJobs(String order, int limit, int skip) async {
    try {
      final response = await _dio.request(
        '/jobs/v2',
        data: {
          'order': order,
          'limit': limit,
          'skip': skip,
        },
        options: Options(method: 'GET'),
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get jobs');
    }
  }
}
