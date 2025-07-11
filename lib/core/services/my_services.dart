import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:listaa/data/repositories/category_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  CategoryData categoryData = Get.put(CategoryDataImpl());
  Future<MyServices> init() async {
    await requestExactAlarmPermission();
    sharedPreferences = await SharedPreferences.getInstance();
    Get.locale = sharedPreferences.getString("lang") != null ? Locale(sharedPreferences.getString("lang")!) : Get.deviceLocale;
    await initializeDateFormatting('ar', null);
    await initializeDateFormatting('en', null);
    await _setDefaultCategories();
    await requestPermission();
    return this;
  }

  Future<void> _setDefaultCategories() async{
    if (sharedPreferences.getBool("isSetCategories") == null ||
        sharedPreferences.getBool("isSetCategories") == false) {
      await categoryData.insertDefaultCategories();
      sharedPreferences.setBool("isSetCategories", true);
    }
  }

  Future<void> requestPermission() async {
  final permissions = [
    Permission.camera,
    Permission.photos,    
    Permission.storage,   
  ];


  for (var permission in permissions) {
    final status = await permission.status;

    if (!status.isGranted) {
     await permission.request();
     
    }
  }

  

  }

  
  Future<bool> requestExactAlarmPermission() async {
    if (await Permission.scheduleExactAlarm.isDenied) {
      final status = await Permission.scheduleExactAlarm.request();
      return status.isGranted;
    }
    return true; 
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
