import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:listaa/data/repositories/category_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  CategoryData categoryData = Get.put(CategoryDataImpl());
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Get.locale = Locale("ar");
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
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
