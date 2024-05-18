import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/job/iqx/iqx_job_repository.dart';
import 'package:ibmq/jobs/job/iqx/model/iqx_job.dart';

part 'iqx_job_state.dart';
part 'iqx_job_cubit.freezed.dart';

class IqxJobCubit extends Cubit<IqxJobState> {
  final IQXJobRepository _repository;

  IqxJobCubit({required IQXJobRepository iqxJobRepository})
      : _repository = iqxJobRepository,
        super(const IqxJobState.initial());

  /// Get IQX Job information
  ///
  /// [jobId] is the job ID
  ///
  /// Emits [IqxJobState.success] with the [IQXJob] if the request is successful,
  /// otherwise emits [IqxJobState.failure] with an error message.
  ///
  /// See [IQXJobRepository.getIQXJob] for more details.
  Future<void> getIQXJob(String jobId) async {
    emit(const IqxJobState.loading());
    switch (await _repository.getIQXJob(jobId).run()) {
      case Left(value: final l):
        emit(IqxJobState.failure(l));
        break;
      case Right(value: final r):
        emit(IqxJobState.success(r));
        break;
      default:
    }
  }
}
