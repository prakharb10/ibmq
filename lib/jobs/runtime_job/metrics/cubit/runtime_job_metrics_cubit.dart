import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/jobs/runtime_job/metrics/model/runtime_job_metrics.dart';
import 'package:ibmq/jobs/runtime_job/runtime_job_repository.dart';
import 'package:ibmq/utils/talker.dart';

part 'runtime_job_metrics_state.dart';
part 'runtime_job_metrics_cubit.freezed.dart';

class RuntimeJobMetricsCubit extends Cubit<RuntimeJobMetricsState> {
  final RuntimeJobRepository _runtimeJobRepository;
  RuntimeJobMetricsCubit({required RuntimeJobRepository runtimeJobRepository})
      : _runtimeJobRepository = runtimeJobRepository,
        super(const RuntimeJobMetricsState.initial());

  /// Load the runtime job metrics
  ///
  /// [jobId] is the job ID
  Future<void> loadMetrics(String jobId) async {
    emit(const RuntimeJobMetricsState.loadInProgress());
    switch (await _runtimeJobRepository.getJobMetrics(jobId: jobId).run()) {
      case Left(value: final l):
        talker.error('Failed to load job metrics', l);
        emit(RuntimeJobMetricsState.loadFailure(l));
        break;
      case Right(value: final r):
        emit(RuntimeJobMetricsState.loadSuccess(r));
        break;
      default:
        emit(const RuntimeJobMetricsState.loadFailure(
            'Failed to load job metrics'));
        break;
    }
  }
}
