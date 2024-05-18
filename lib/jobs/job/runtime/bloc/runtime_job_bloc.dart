import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/job/runtime/model/runtime_job.dart';
import 'package:ibmq/jobs/job/runtime/runtime_job_repository.dart';

part 'runtime_job_event.dart';
part 'runtime_job_state.dart';
part 'runtime_job_bloc.freezed.dart';

class RuntimeJobBloc extends Bloc<RuntimeJobEvent, RuntimeJobState> {
  final RuntimeJobRepository _repository;
  RuntimeJobBloc({required RuntimeJobRepository runtimeJobRepository})
      : _repository = runtimeJobRepository,
        super(const _Initial()) {
    on<_Loaded>((event, emit) async {
      emit(const _Loading());
      switch (await _repository.getRuntimeJob(jobId: event.jobId).run()) {
        case Left(:final value):
          emit(_Failure(value));
          break;
        case Right(:final value):
          emit(_Success(value));
          break;
      }
    });
  }
}
