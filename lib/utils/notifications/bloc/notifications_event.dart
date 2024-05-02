part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.started() = _Started;
  const factory NotificationsEvent.received(JobStatusUpdate jobStatusUpdate) =
      _Received;
  const factory NotificationsEvent.clear(JobStatusUpdate jobStatusUpdate) =
      _Clear;
  const factory NotificationsEvent.clearAll() = _ClearAll;
}
