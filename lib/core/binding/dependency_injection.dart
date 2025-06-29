import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/onboarding_controller.dart';
import 'package:listaa/controller/welcome_controller.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=> WelcomeController());
   Get.lazyPut(()=> OnboardingController());
   Get.lazyPut(()=> HomeController());

  }
}