part of 'runtime_job_bloc.dart';

@freezed
class RuntimeJobEvent with _$RuntimeJobEvent {
  const factory RuntimeJobEvent.started() = _Started;
  const factory RuntimeJobEvent.loaded(String jobId) = _Loaded;
}
