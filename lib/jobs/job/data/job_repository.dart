import 'dart:developer';

import 'package:ibmq/jobs/job/data/job_data_provider.dart';
import 'package:ibmq/jobs/job/model/job.dart';

class JobRepository {
  final JobDataProvider jobDataProvider;

  JobRepository(this.jobDataProvider);

  Future<Job> getJobInfo(String jobId) async {
    try {
      final resp = await jobDataProvider.getJobInfo(jobId);
      final job = Job.fromJson(resp.data);
      return job;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to get job info');
    }
  }
}
