import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/view/home/screens/home_screen.dart';
import 'package:listaa/view/lists/screens/lists_screen.dart';
import 'package:listaa/view/new_list/screens/new_list_screen.dart';
import 'package:listaa/view/remainder/screens/remainders_screen.dart';
import 'package:listaa/view/onboarding/screens/onboarding_screen.dart';
import 'package:listaa/view/reports/screen/reports_screen.dart';
import 'package:listaa/view/trash/screens/trash_screen.dart';
import 'package:listaa/view/welcome/screens/welcome_screen.dart';


class AppRouter {
  static List<GetPage> pages = [
    GetPage(name: AppRouterKeys.welcome, page: () =>  WelcomeScreen()),
    GetPage(name: AppRouterKeys.onBoarding, page: () =>  OnboardingScreen()),
    GetPage(name: AppRouterKeys.home, page: () =>  HomeScreen()),
    GetPage(name: AppRouterKeys.newList, page: () =>  NewListScreen()),
    GetPage(name: AppRouterKeys.lists, page: () =>  ListsScreen()),
    GetPage(name: AppRouterKeys.remainders, page: () =>  RemaindersScreen()),
    GetPage(name: AppRouterKeys.trash, page: () =>  TrashScreen()),
    GetPage(name: AppRouterKeys.reports, page: () =>  ReportsScreen()),
  ];
}