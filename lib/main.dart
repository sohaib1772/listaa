import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:listaa/core/binding/dependency_injection.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/routing/app_router.dart';
import 'package:listaa/core/theme/app_theme.dart';
import 'package:listaa/view/welcome/screens/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
          locale: const Locale('ar', 'US'),
          initialBinding: DependencyInjection(),
          getPages: AppRouter.pages,
        );
      },
    );
  }
}
