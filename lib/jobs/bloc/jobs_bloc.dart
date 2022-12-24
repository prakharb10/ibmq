import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/jobs/data/jobs_repository.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/job.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';
part 'jobs_bloc.g.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;
  JobsBloc({required this.jobsRepository}) : super(JobsInitial()) {
    on<JobsRequested>((event, emit) async {
      emit(JobsLoading());
      try {
        final response =
            await jobsRepository.getJobs(event.order, event.limit, event.skip);
        emit(JobsLoaded.fromJson(response.data));
      } catch (e) {
        log(e.toString());
        emit(const JobsError(message: "Failed to get jobs"));
      }
    });
  }
}
