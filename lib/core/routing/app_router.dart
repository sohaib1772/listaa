import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/middlewares/welcome_and_onboarding_middleware.dart';
import 'package:listaa/view/about_us/screen/about_us_screen.dart';
import 'package:listaa/view/home/screens/home_screen.dart';
import 'package:listaa/view/lists/screens/lists_screen.dart';
import 'package:listaa/view/new_list/screens/new_list_screen.dart';
import 'package:listaa/view/privacy/privacy_screen.dart';
import 'package:listaa/view/qr_scanner/screen/qr_camera_scanner_screen.dart';
import 'package:listaa/view/recipes/screen/recipes_screen.dart';
import 'package:listaa/view/remainder/screens/remainders_screen.dart';
import 'package:listaa/view/reports/screen/reports_screen.dart';
import 'package:listaa/view/trash/screens/trash_screen.dart';
import 'package:listaa/view/welcome/screens/welcome_screen.dart';


class AppRouter {
  static List<GetPage> pages = [
    GetPage(name: AppRouterKeys.welcome, page: () =>  WelcomeScreen(),middlewares: [
      WelcomeAndOnBoardingMiddleware(),
    ]),
   
    GetPage(name: AppRouterKeys.home, page: () =>  HomeScreen()),
    GetPage(name: AppRouterKeys.newList, page: () =>  NewListScreen()),
    GetPage(name: AppRouterKeys.lists, page: () =>  ListsScreen()),
    GetPage(name: AppRouterKeys.remainders, page: () =>  RemaindersScreen()),
    GetPage(name: AppRouterKeys.trash, page: () =>  TrashScreen()),
    GetPage(name: AppRouterKeys.reports, page: () =>  ReportsScreen()),
    GetPage(name: AppRouterKeys.qrCameraScannerScreen, page: () =>  QrCameraScannerScreen()),
    GetPage(name: AppRouterKeys.aboutUs, page: () =>  AboutUsScreen()),
    GetPage(name: AppRouterKeys.privacy, page: () =>  PrivacyScreen()),
    GetPage(name: AppRouterKeys.recipes, page: () =>  RecipesScreen()),
  ];
}