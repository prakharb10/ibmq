import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/utils/notifications/local_notifications.dart';

part 'notification_permissions_state.dart';
part 'notification_permissions_cubit.freezed.dart';

class NotificationPermissionsCubit extends Cubit<NotificationPermissionsState> {
  final LocalNotifications _localNotifications;
  NotificationPermissionsCubit({required LocalNotifications localNotifications})
      : _localNotifications = localNotifications,
        super(const NotificationPermissionsState.initial());

  Future<void> checkPermissions() async {
    switch (await _localNotifications.checkPermissions().run()) {
      case Some(value: true):
        emit(const NotificationPermissionsState.granted());
        break;
      case Some(value: false):
        emit(const NotificationPermissionsState.denied());
        break;
      case None():
        emit(const NotificationPermissionsState.unknown());
        break;
    }
  }
}
