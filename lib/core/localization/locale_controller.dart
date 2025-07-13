import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:listaa/core/services/my_services.dart';

class LocaleController extends GetxController{
  MyServices myServices = Get.find();
  void changeLang(String codeLang){
    Get.updateLocale(Locale(codeLang));
    myServices.sharedPreferences.setString("lang", codeLang);
    update();
  }
}