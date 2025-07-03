import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.drawerLinerGradient),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    AppDrawerIconButton(
                      icon:  AppIconsName.close,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      AppLocaleKeys.listaApp.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                    Spacer(),
                   IconButton(onPressed: (){}, icon: AppIcons(icon: AppIconsName.notifications,size: 30,))
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20.h),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppDrawerTextIconButton(
                              onPressed: () {},
                              text: AppLocaleKeys.lists.tr,
                            ),
                            AppDrawerTextIconButton(
                              onPressed: () {},
                              text: AppLocaleKeys.remainders.tr,
                              icon: AppIconsName.clock,
                            ),
                            AppDrawerTextIconButton(
                              onPressed: () {},
                              text: AppLocaleKeys.moneyReports.tr,
                              icon:  AppIconsName.chart,
                            ),
                            Divider(height: 20.h),

                            //--------------------
                            Text(
                              
                              AppLocaleKeys.categories.tr,
                              style: AppTextStyles.darkbold20,
                            ),
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.event,
                              onPressed: () {},
                              text: AppLocaleKeys.holyDaysAndEvents.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.fruits,
                              onPressed: () {},
                              text: AppLocaleKeys.fruitsAndVegetable.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.drink,
                              onPressed: () {},
                              text: AppLocaleKeys.marketAndOthers.tr,
                            ),
                            
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.add,
                              onPressed: () {},
                              text: AppLocaleKeys.newCategory.tr,
                            ),

                            Divider(height: 20.h,),
                            //--------------------
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.settings,
                              onPressed: () {},
                              text: AppLocaleKeys.settings.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon:  AppIconsName.trash,
                              onPressed: () {},
                              text: AppLocaleKeys.trashBasket.tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          width: 67.w,
                          height: 314.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          width: 43.w,
                          height: 373.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color(0xFFB3D3D4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}