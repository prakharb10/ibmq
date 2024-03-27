part of 'runtime_job_metrics_cubit.dart';

@freezed
class RuntimeJobMetricsState with _$RuntimeJobMetricsState {
  const factory RuntimeJobMetricsState.initial() = _Initial;
  const factory RuntimeJobMetricsState.loadInProgress() = LoadInProgress;
  const factory RuntimeJobMetricsState.loadSuccess(RuntimeJobMetrics metrics) =
      LoadSuccess;
  const factory RuntimeJobMetricsState.loadFailure(String error) = LoadFailure;
}
