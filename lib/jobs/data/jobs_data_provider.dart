import 'dart:developer';

import 'package:dio/dio.dart';

class JobsDataProvider {
  final Dio _dio;

  JobsDataProvider(this._dio);

  Future<Response> getJobs(int skip,
      [int limit = 10, String order = "creationDate DESC"]) async {
    try {
      final response = await _dio.get(
        '/jobs/v2',
        queryParameters: {
          'order': order,
          'limit': limit,
          'skip': skip,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get jobs');
    }
  }
}
