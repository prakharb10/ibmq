part of 'user_jobs_updates_bloc.dart';

@freezed
class UserJobsUpdatesEvent with _$UserJobsUpdatesEvent {
  const factory UserJobsUpdatesEvent.started() = _Started;
  const factory UserJobsUpdatesEvent.cancelled() = _Cancelled;
}
