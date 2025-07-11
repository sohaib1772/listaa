import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print("\ud83d\udce5 Notification tapped in background: \${notificationResponse.payload}");
}

const String reminderTaskName = "listaaReminderTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final id = inputData?["id"] ?? 0;
    final prefs = await SharedPreferences.getInstance();
    final plugin = FlutterLocalNotificationsPlugin();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: androidSettings);
    await plugin.initialize(initSettings);

    final title = prefs.getString('title_\$id') ?? 'Reminder';
    final body = prefs.getString('body_\$id') ?? 'There is a list to be scheduled today! \u26a0\ufe0f';

    await plugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'listaa_reminders_channel_v2',
          'listaa reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );

    await prefs.remove('title_\$id');
    await prefs.remove('body_\$id');
    return true;
  });
}

class NotificationsHelper {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();
    final currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        print("\u2705 Notification clicked: \${response.payload}");
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    await requestPermission();
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  static Future<void> requestPermission() async {
    final androidImplementation =
        _notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestNotificationsPermission();
  }

  static Future<void> simpleNotification({
    int id = 1,
    required String title,
    required String body,
  }) async {
    await _notificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'listaa_reminders_channel_v2',
          'listaa reminders',
          channelDescription: 'Reminder notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  static Future<void> scheduleNotification({
    required int id,
    required DateTime scheduledDate,
    String? title,
  }) async {
    final now = DateTime.now();
    if (scheduledDate.isBefore(now)) {
      print("\u274c Cannot schedule in the past");
      return;
    }

    final delay = scheduledDate.difference(now);
    print("\u23f0 Scheduling work in \$delay");

    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('lang');
    await prefs.setString('title_\$id',
        title ?? (lang == 'en' ? 'Reminder Listaa' : 'تطبيق Listaa'));
    await prefs.setString('body_\$id',
        lang == 'en' ? 'There is a list to be scheduled today! ⚠️' : 'هناك قائمة للقيام بها اليوم! ⚠️');

    await Workmanager().registerOneOffTask(
      "reminder_\$id",
      reminderTaskName,
      initialDelay: delay,
      inputData: {"id": id},
      constraints: Constraints(networkType: NetworkType.notRequired),
    );

    print("\u2705 Reminder scheduled via Workmanager");
  }
}