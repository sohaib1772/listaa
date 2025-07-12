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
    sharedPreferences = await SharedPreferences.getInstance();
    Get.locale = sharedPreferences.getString("lang") != null ? Locale(sharedPreferences.getString("lang")!) : Get.deviceLocale;
    await initializeDateFormatting('ar', null);
    await initializeDateFormatting('en', null);
    await _setDefaultCategories();
    return this;
  }

  Future<void> _setDefaultCategories() async{
    if (sharedPreferences.getBool("isSetCategories") == null ||
        sharedPreferences.getBool("isSetCategories") == false) {
      await categoryData.insertDefaultCategories();
      sharedPreferences.setBool("isSetCategories", true);
    }
  }

  Future<bool> requestPermission() async {
  
    
  
  final cameraStatus = await Permission.camera.request();
  final photosStatus = await Permission.photos.request();
  final allGranted = cameraStatus.isGranted && photosStatus.isGranted;
  if(!allGranted){
    return false;
  }

  return allGranted;

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
