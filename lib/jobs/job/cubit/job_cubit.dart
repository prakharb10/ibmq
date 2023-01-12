import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/job/data/job_data_provider.dart';
import 'package:ibmq/jobs/job/data/job_repository.dart';

import '../model/job.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final Dio dio;
  JobCubit(this.dio) : super(JobInitial());

  Future<void> getJobInfo(String jobId) async {
    final repo = JobRepository(JobDataProvider(dio));
    emit(JobLoading());
    try {
      final job = await repo.getJobInfo(jobId);
      emit(JobLoaded(job));
    } catch (e) {
      emit(JobLoadFailed(e.toString()));
    }
  }
}
