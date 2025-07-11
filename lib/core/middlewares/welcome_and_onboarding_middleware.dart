import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/services/my_services.dart';

class WelcomeAndOnBoardingMiddleware extends GetMiddleware{
  @override
  int? priority = 1;


  MyServices myServices = Get.find<MyServices>();

  @override
RouteSettings? redirect(String? route) {
  final isFirstTime =myServices.sharedPreferences.getBool("firstTime") ?? false;

  return !isFirstTime ? null : const RouteSettings(name: AppRouterKeys.home);
}
  
  
}