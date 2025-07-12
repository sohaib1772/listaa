import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/controller/category_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/localization/locale_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/drawer/drawer_categories.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  LocaleController localeController = Get.find<LocaleController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.drawerLinerGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    AppDrawerIconButton(
                      icon: AppIconsName.close,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      AppLocaleKeys.listaApp.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20.h),
              AppDrawerTextIconButton(
                onPressed: () {
                  Get.toNamed(AppRouterKeys.lists);
                },
                text: AppLocaleKeys.lists.tr,
              ),
              AppDrawerTextIconButton(
                onPressed: () {
                  Get.toNamed(AppRouterKeys.remainders);
                },
                text: AppLocaleKeys.remainders.tr,
                icon: AppIconsName.clock,
              ),
              AppDrawerTextIconButton(
                onPressed: () {
                  Get.toNamed(AppRouterKeys.reports);
                },
                text: AppLocaleKeys.moneyReports.tr,
                icon: AppIconsName.chart,
              ),
              Divider(height: 10.h),

              //--------------------
              DrawerCategories(),

              Divider(height: 20.h),
              //--------------------
              
              AppDrawerTextIconButton(
                icon: AppIconsName.trash,
                onPressed: () {
                  Get.toNamed(AppRouterKeys.trash);
                },
                text: AppLocaleKeys.trashBasket.tr,
              ),
              //--------------------
              Divider(height: 20.h),
              AppDrawerTextIconButton(
                icon: AppIconsName.aboutUs,
                onPressed: () {
                  Get.toNamed(AppRouterKeys.aboutUs);
                },
                text: AppLocaleKeys.aboutUs.tr,
              ),
              AppDrawerTextIconButton(
                icon: AppIconsName.privacy,
                onPressed: () {
                  Get.toNamed(AppRouterKeys.privacy);
                },
                text: AppLocaleKeys.privacyPolicy.tr,
              ),
              AppDrawerTextIconButton(
                icon: AppIconsName.contact,
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'devnest.te@gmail.com',
                  );
                  await launchUrl(emailLaunchUri);
                },
                text: AppLocaleKeys.contactUs.tr,
              ),
              Divider(height: 20.h),
              CustomPopup(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Text(
                        "العربية 🇮🇶",
                        style: AppTextStyles.darkbold20,
                      ),
                      onTap: () async {
                        localeController.changeLang("ar");
                        Get.back();
                      },
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      child: Text(
                        "English 🇺🇸",
                        style: AppTextStyles.darkbold20,
                      ),
                      onTap: () async {
                        localeController.changeLang("en");
                        Get.back();
                      },
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.drawerIconButtonsbackgroundColor,
                  ),
                  child: Text(
                    Get.locale!.languageCode == "ar"
                        ? "العربية 🇮🇶"
                        : "English 🇺🇸",
                    style: AppTextStyles.darkbold20,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
