part of 'runtime_job_bloc.dart';

@freezed
class RuntimeJobState with _$RuntimeJobState {
  const factory RuntimeJobState.initial() = _Initial;
  const factory RuntimeJobState.loading() = Loading;
  const factory RuntimeJobState.success(RuntimeJob job) = Success;
  const factory RuntimeJobState.failure(String message) = Failure;
}
