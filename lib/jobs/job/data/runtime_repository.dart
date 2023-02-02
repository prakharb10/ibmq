import 'dart:developer';

import 'package:ibmq/jobs/job/model/runtime_result.dart';

import 'runtime_data_provider.dart';

class RuntimeRepository {
  final RuntimeDataProvider runtimeDataProvider;

  RuntimeRepository(this.runtimeDataProvider);

  Future<RuntimeResult> getJobResults(String jobId) async {
    try {
      final response = await runtimeDataProvider.getJobResults(jobId);
      if ((response.data as Map).containsKey('values')) {
        return EstimatorResult.fromJson(response.data);
      } else if ((response.data as Map).containsKey('quasi_dists')) {
        return SamplerResult.fromJson(response.data);
      } else {
        throw Exception('Failed to get job results');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job results');
    }
  }
}
