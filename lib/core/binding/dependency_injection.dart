import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/controller/onboarding_controller.dart';
import 'package:listaa/controller/welcome_controller.dart';
import 'package:listaa/data/static/home_data.dart';
import 'package:listaa/data/static/list_data.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=> WelcomeController());
   Get.lazyPut(()=> OnboardingController());
   Get.lazyPut(()=> NewListController(),fenix: true);
   Get.lazyPut(()=> HomeController(),fenix: true);

    Get.lazyPut(()=>HomeDataImpl());
   Get.lazyPut(()=>ListDataImpl());
  
  }
}