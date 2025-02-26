import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  bool isInitialized = false;

  bool get initialized => isInitialized;

  Future<void> requestPermissions() async {
    final androidPlugin =
        notificationPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    if (androidPlugin != null) {
      final bool? granted =
          await androidPlugin.requestNotificationsPermission();
      if (granted == null || !granted) {
        debugPrint('Notification permission denied');
      } else {
        debugPrint('Notification permission granted');
      }
    }
  }

  Future<void> initNotification() async {
    if (isInitialized) return;

    await requestPermissions();
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
    isInitialized = true;
  }

  NotificationDetails notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    if (!isInitialized) {
      await initNotification(); // Ensure it's initialized
    }
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
