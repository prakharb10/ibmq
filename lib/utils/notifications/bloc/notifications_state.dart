part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = Initial;
  const factory NotificationsState.loaded(
      Map<String, JobStatusUpdate> jobStatusUpdates) = Loaded;
}
