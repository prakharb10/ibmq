part of 'user_jobs_updates_bloc.dart';

@freezed
class UserJobsUpdatesState with _$UserJobsUpdatesState {
  const factory UserJobsUpdatesState.initial() = _Initial;
  const factory UserJobsUpdatesState.connecting() = Connecting;
  const factory UserJobsUpdatesState.listening(
      JobStatusUpdate jobStatusUpdate) = Listening;
}
