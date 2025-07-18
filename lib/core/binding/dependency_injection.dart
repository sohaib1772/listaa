import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:listaa/controller/all_lists_controller.dart';
import 'package:listaa/controller/category_controller.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/controller/onboarding_controller.dart';
import 'package:listaa/controller/recpice_controller.dart';
import 'package:listaa/controller/remainder_controller.dart';
import 'package:listaa/controller/reports_controller.dart';
import 'package:listaa/controller/trash_controller.dart';
import 'package:listaa/controller/welcome_controller.dart';
import 'package:listaa/core/helper/formatter.dart';
import 'package:listaa/core/localization/locale_controller.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:listaa/data/repositories/category_data.dart';
import 'package:listaa/data/repositories/list_data.dart';
import 'package:listaa/data/repositories/money_report_data.dart';
import 'package:listaa/data/repositories/recipe_data.dart';
import 'package:listaa/data/repositories/reminders_data.dart';
import 'package:listaa/data/repositories/trash_data.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => ListDataImpl(), fenix: true);
    Get.lazyPut(() => TrashDataImpl(), fenix: true);
    Get.lazyPut(() => RemindersDataImpl(), fenix: true);
    Get.lazyPut(() => NewListController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ReportsController(), fenix: true);
    Get.lazyPut(() => RemainderController(), fenix: true);
    Get.lazyPut(() => AllListsController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => TrashController(), fenix: true);
    Get.lazyPut(() => Formatter(), fenix: true);
    Get.lazyPut(() => CategoryDataImpl(), fenix: true);
    Get.lazyPut(() => MoneyReportDataImpl(), fenix: true);
    Get.lazyPut(() => MyServices(), fenix: true);
    Get.lazyPut(() => LocaleController(), fenix: true);
    Get.lazyPut(() => RecipeDataImpl(), fenix: true);
    Get.lazyPut(() => RecipeController(), fenix: true);

  }
}
