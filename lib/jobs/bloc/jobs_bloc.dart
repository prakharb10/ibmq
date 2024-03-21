import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/jobs/jobs_repository.dart';
import 'package:ibmq/jobs/model/user_jobs.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({required JobsRepository jobsRepository}) : super(JobsInitial()) {
    on<UserJobsRequested>((event, emit) async {
      emit(JobsLoadInProgress());
      switch (await jobsRepository
          .listUserJobs(
            provider: event.provider,
            pending: event.pending,
            backend: event.backend,
            sort: event.sort,
            limit: event.limit,
            offset: event.offset,
            createdAfter: event.createdAfter,
            createdBefore: event.createdBefore,
            tags: event.tags,
            program: event.program,
            sessionId: event.sessionId,
            search: event.search,
          )
          .run()) {
        case Left(value: final error):
          emit(JobsLoadFailure(error: error));
          break;
        case Right(value: final userJobs):
          emit(JobsLoadSuccess(userJobs: userJobs));
          break;
      }
    });
  }
}
