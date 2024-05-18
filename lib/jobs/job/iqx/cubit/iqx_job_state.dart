part of 'iqx_job_cubit.dart';

@freezed
class IqxJobState with _$IqxJobState {
  const factory IqxJobState.initial() = _Initial;
  const factory IqxJobState.loading() = Loading;
  const factory IqxJobState.success(IQXJob job) = Success;
  const factory IqxJobState.failure(String message) = Failure;
}
