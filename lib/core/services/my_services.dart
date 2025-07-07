import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Get.locale = Locale("ar");
     await initializeDateFormatting('ar', null);
      await initializeDateFormatting('en', null);
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
