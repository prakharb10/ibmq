import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/model/job.dart';

part 'jobs_cache_state.dart';

class JobsCacheCubit extends Cubit<JobsCacheState> {
  final List<BaseJob> _jobs = [];
  JobsCacheCubit() : super(JobsCacheInitial());

  void addJobs(List<BaseJob> jobs) {
    _jobs.addAll(jobs);
    emit(JobsCacheLoaded(_jobs));
  }

  void clear() {
    _jobs.clear();
    emit(JobsCacheInitial());
  }

  void getJobs() {
    emit(JobsCacheLoaded(_jobs));
  }
}
