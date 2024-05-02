part of 'notification_permissions_cubit.dart';

@freezed
class NotificationPermissionsState with _$NotificationPermissionsState {
  const factory NotificationPermissionsState.initial() = _Initial;
  const factory NotificationPermissionsState.granted() = Granted;
  const factory NotificationPermissionsState.denied() = Denied;
  const factory NotificationPermissionsState.unknown() = Unknown;
}
