import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print(
    "\ud83d\udce5 Notification tapped in background: \${notificationResponse.payload}",
  );
}

const String reminderTaskName = "listaaReminderTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final id = inputData?["id"] ?? 0;
    final prefs = await SharedPreferences.getInstance();
    final plugin = FlutterLocalNotificationsPlugin();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final initSettings = InitializationSettings(android: androidSettings);
    await plugin.initialize(initSettings);

    final title = prefs.getString('title_\$id') ?? 'Reminder';
    final body =
        prefs.getString('body_\$id') ??
        'There is a list to be scheduled today! \u26a0\ufe0f';

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

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final initSettings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        print("\u2705 Notification clicked: \${response.payload}");
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    await Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  static Future<bool> requestPermission() async {
    final androidImplementation = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final status = await androidImplementation
        ?.requestNotificationsPermission();
    return status ?? false;
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
    bool isGranted = await Get.find<MyServices>().requestExactAlarmPermission();
    if (!isGranted) {
      return;
    }

    final now = DateTime.now();
    if (scheduledDate.isBefore(now)) {
      print("\u274c Cannot schedule in the past");
      return;
    }

    final delay = scheduledDate.difference(now);

    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('lang') ?? Get.deviceLocale;
    await prefs.setString(
      'title_\$id',
      title ?? (lang == 'en' ? 'Reminder Listaa' : 'تطبيق Listaa'),
    );
    final random = Random();
    final body = lang == 'en'
        ? funnyNotificationsEn[random.nextInt(funnyNotificationsEn.length)]
        : funnyNotificationsAr[random.nextInt(funnyNotificationsAr.length)];
    await prefs.setString('body_\$id', body);

    await Workmanager().registerOneOffTask(
      "reminder_\$id",
      reminderTaskName,
      initialDelay: delay,
      inputData: {"id": id},
      constraints: Constraints(networkType: NetworkType.notRequired),
    );

    print("\u2705 Reminder scheduled via Workmanager");
  }

  static List<String> funnyNotificationsEn = [
    "🧠 Farfoosh says: You’ve got a list to tackle! No escaping 😏",
    "📋 Farfoosh: Get up, your list is calling! 🚀",
    "🔔 Farfoosh: The list won’t check itself 😜",
    "👀 Farfoosh is watching! Time to work, champ ✨",
    "📣 Farfoosh: Let’s smash it today, shall we? 😉",
    "📝 Farfoosh: Your list misses you, go check it!",
    "🤓 Farfoosh: Reminder time, don’t forget!",
    "🐢 Farfoosh: Don’t go slow, finish the list 🐇",
    "🔥 Farfoosh: Be on fire today and check that list!",
    "💡 Farfoosh: Cool stuff in that list, I promise!",
    "🚨 Farfoosh: Emergency alert! List time!",
    "⏰ Farfoosh: Time’s ticking… your list awaits 😬",
    "😴 Farfoosh: Wake up! The list is yelling 😅",
    "👨‍🏫 Farfoosh: Let’s be productive heroes! 💪",
    "🤖 Farfoosh: Engaged productivity mode!",
    "🎯 Farfoosh: Focus up! List is waiting!",
    "📆 Farfoosh: Got tasks today? Oh yes you do!",
    "🙃 Farfoosh: Don’t pretend you forgot 😅",
    "😎 Farfoosh: Real champs never forget their list!",
    "🚀 Farfoosh: Power, focus, list! 💥",
  ];
  static List<String> funnyNotificationsAr = [
    "🧠 فرفوش يقول: لديك قائمة بانتظارك، لا تؤجل الإنجاز!",
    "📋 فرفوش: آن الأوان لتنطلق وتُتمّ مهامك!",
    "🔔 فرفوش: هل نسيت قائمتك؟ أنا لم أنسَ! 😄",
    "👀 فرفوش يراقبك... هل بدأت العمل على قائمتك؟",
    "📣 فرفوش ينادي: لنبدأ إنجاز المهام الآن! 🚀",
    "📝 فرفوش: قائمتك تشتاق إليك، ألقِ نظرة عليها!",
    "🤓 فرفوش: تذكير لطيف بوجود قائمة تنتظر الاهتمام.",
    "🐢 فرفوش: لا تدع البطء يسيطر عليك، أسرع نحو قائمتك! 🐇",
    "🔥 فرفوش: يوم جديد، حماس جديد، وقائمة تنتظر الإنجاز!",
    "💡 فرفوش: في قائمتك أفكار رائعة... دعنا نبدأ!",
    "🚨 فرفوش: تنبيه هام! لديك قائمة اليوم!",
    "⏰ فرفوش: الساعة تدق، هل أنهيت قائمتك؟",
    "😴 فرفوش: لا وقت للراحة الآن، المهام بانتظارك!",
    "👨‍🏫 فرفوش: فلنكن مثاليين وننهي المهام بذكاء 💪",
    "🤖 فرفوش: تم تفعيل وضع الإنجاز... انطلق!",
    "🎯 فرفوش: التركيز هو سر النجاح، وها هي قائمتك!",
    "📆 فرفوش: اليوم مليء بالفرص... والقوائم! ابدأ الآن.",
    "🙃 فرفوش: تذكير بسيط بأن لديك مهام تستحق التنفيذ.",
    "😎 فرفوش: الأذكياء لا ينسون قوائمهم!",
    "🚀 فرفوش: إلى القمة نرتقي، خطوة بخطوة مع قائمتك! 💫",
  ];
}
