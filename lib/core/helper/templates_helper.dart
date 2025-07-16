

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplatesHelper{
  
  static String getImage(String type){

    switch(type){
      case "adha":
        return 'assets/templates/adha_${Get.locale!.languageCode}.png';
      case "cake":
        return 'assets/templates/cake_${Get.locale!.languageCode}.png';
      case "chicken":
        return 'assets/templates/chicken_${Get.locale!.languageCode}.png';
      case "market":
        return 'assets/templates/market_${Get.locale!.languageCode}.png';
      case "school":
        return 'assets/templates/school_${Get.locale!.languageCode}.png';
      case "trip":
        return 'assets/templates/trip_${Get.locale!.languageCode}.png';
      default:
        return 'assets/templates/default_${Get.locale!.languageCode}.png';
    }
  }

  
}