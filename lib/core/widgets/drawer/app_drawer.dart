import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.homeLinerGradient),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    AppDrawerIconButton(
                      icon: Icons.close_sharp,
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
                    Icon(
                      Icons.notifications,
                      color: AppColors.primaryTextColor,
                      size: 35.sp,
                    ),
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
                              icon: Icons.watch_later,
                            ),
                            AppDrawerTextIconButton(
                              onPressed: () {},
                              text: AppLocaleKeys.moneyReports.tr,
                              icon: Icons.bar_chart_sharp,
                            ),
                            Divider(height: 20.h),

                            //--------------------
                            Text(
                              
                              AppLocaleKeys.categories.tr,
                              style: AppTextStyles.darkbold20,
                            ),
                            AppDrawerTextIconButton(
                              icon: Icons.wallet_giftcard_sharp,
                              onPressed: () {},
                              text: AppLocaleKeys.holyDaysAndEvents.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon: Icons.apple,
                              onPressed: () {},
                              text: AppLocaleKeys.frutsAndVigitable.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon: Icons.local_drink,
                              onPressed: () {},
                              text: AppLocaleKeys.marketAndOthers.tr,
                            ),
                            
                            AppDrawerTextIconButton(
                              icon: Icons.add_box_outlined,
                              onPressed: () {},
                              text: AppLocaleKeys.newCategory.tr,
                            ),

                            Divider(height: 20.h,),
                            //--------------------
                            AppDrawerTextIconButton(
                              icon: Icons.settings,
                              onPressed: () {},
                              text: AppLocaleKeys.settings.tr,
                            ),
                            AppDrawerTextIconButton(
                              icon: Icons.delete,
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