import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:listaa/core/binding/dependency_injection.dart';
import 'package:listaa/core/helper/notifications_helper.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/routing/app_router.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:listaa/core/theme/app_theme.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await NotificationsHelper.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Listaa',
          theme: AppTheme.theme,
          translations: AppLocale(),
          locale: Get.locale,
          initialBinding: DependencyInjection(),
          
          getPages: AppRouter.pages,
        );
      },
    );
  }
}
