import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fpdart/fpdart.dart';

class LocalNotifications {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const darwinNotificationDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
    presentBanner: true,
    presentList: true,
  );

  Future<void> initialize() async {
    const darwinInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(macOS: darwinInitializationSettings),
    );
  }

  TaskOption<bool> checkPermissions() => TaskOption(() async =>
      Option.fromNullable((await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  MacOSFlutterLocalNotificationsPlugin>()
              ?.checkPermissions())
          ?.isEnabled));

  Future<void> sendNotification(
      {required int id, required String title, required String body}) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(macOS: darwinNotificationDetails),
    );
  }
}
