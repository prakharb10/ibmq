import 'dart:convert';
import 'dart:developer';

import 'package:ibmq/jobs/job/model/runtime_result.dart';

import 'runtime_data_provider.dart';

class RuntimeRepository {
  final RuntimeDataProvider runtimeDataProvider;

  RuntimeRepository(this.runtimeDataProvider);

  Future<RuntimeResult> getJobResults(String jobId) async {
    try {
      final response = await runtimeDataProvider.getJobResults(jobId);
      final data = jsonDecode(response.data);
      if ((data as Map<String, dynamic>).containsKey('values')) {
        return EstimatorResult.fromJson(data);
      } else if ((data).containsKey('quasi_dists')) {
        return SamplerResult.fromJson(data);
      } else {
        throw Exception('Failed to get job results');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job results');
    }
  }
}
