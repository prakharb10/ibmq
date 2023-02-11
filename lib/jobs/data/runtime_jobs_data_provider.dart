import 'dart:developer';

import 'package:dio/dio.dart';

class RuntimeJobsDataProvider {
  final Dio _dio;

  RuntimeJobsDataProvider(this._dio);

  Future<Response> getJobs(int offset, [int limit = 10]) async {
    try {
      final response = await _dio.get(
        '/jobs',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'exclude_params': false,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get jobs');
    }
  }

  Future<Response> getJobMetrics(String jobId) async {
    try {
      final response = await _dio.get(
        '/jobs/$jobId/metrics',
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job metrics');
    }
  }
}
