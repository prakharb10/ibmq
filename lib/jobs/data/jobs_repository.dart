import 'package:dio/dio.dart';
import 'package:ibmq/jobs/data/jobs_data_provider.dart';

class JobsRepository {
  final JobsDataProvider jobsDataProvider;

  JobsRepository(this.jobsDataProvider);

  Future<Response> getJobs(String order, int limit, int skip) async {
    return await jobsDataProvider.getJobs(order, limit, skip);
  }
}
