import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:go_router_mobile/services/notifications/custom_notification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

import '../../routes/router.dart';

class NotificationsService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationDetails;

  NotificationsService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _setupTimeZone();
    await _initializeNotifications();
  }

  Future<void> _setupTimeZone() async {
    tz.initializeTimeZones();

    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onSelectNotification: _onSelectedNotication,
    );
  }

  _onSelectedNotication(String? payload) {
    //! Alterar payload para Map<String, String> ou passar o parametro do FCM
    if (payload != null && payload.isNotEmpty) {
      router.pushNamed(payload, params: {'pid': '555'});
    }
  }

  showNotification(CustomNotification notification) {
    //Setup exhibition Notifications for Android
    androidNotificationDetails = const AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );

    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidNotificationDetails),
      payload: notification.payload,
    );
  }

  checkforNotifications() async {
    final details = await localNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {
      _onSelectedNotication(details.payload);
    }
  }
}
