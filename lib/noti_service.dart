import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isIntialized => _isInitialized;

  // Intialize
  Future<void> initNotification() async {
    if (isIntialized) return; // prevent re-initialization
    // Android Initialization
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );
    await notificationPlugin.initialize(initSettings);
    _isInitialized = true;
    // iOS Initialization
  }

  // Notification Detail
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // Show Notification

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(),
    );
  }
}
