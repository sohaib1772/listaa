import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class HomeSelectProiority extends StatelessWidget {
  HomeSelectProiority({super.key, this.horizontalPadding = 20});
  HomeController controller = Get.find();
  double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: horizontalPadding.w),
          SelectPriorityButton(iconNames: AppIconsName.all,priority: 0,),
          SizedBox(width: 5.w),
          SelectPriorityButton(iconNames: AppIconsName.redFlag,priority: 1,),
          SizedBox(width: 5.w),
          SelectPriorityButton(iconNames: AppIconsName.blueFlag,priority: 2,),
          SizedBox(width: 5.w),
          SelectPriorityButton(iconNames: AppIconsName.grayFlag,priority: 3,),
          SizedBox(width: horizontalPadding.w),
        ],
      ),
    );
  }
}

class SelectPriorityButton extends StatelessWidget {
   SelectPriorityButton({super.key,required this.iconNames,required this.priority});

  HomeController controller = Get.find();
  AppIconsName iconNames;
  int priority;

  BoxDecoration getDecoration(int index) {
    if (index == controller.priority.value) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.5),
      );
    }
    return BoxDecoration(
       border: Border.all(color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white.withAlpha(20),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return AppLocaleKeys.allPriority.tr;
      case 1:
        return AppLocaleKeys.highPriority.tr;
      case 2:
        return AppLocaleKeys.midPriority.tr;
      case 3:
        return AppLocaleKeys.lowPriority.tr;
      default:
        return AppLocaleKeys.allPriority.tr;
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              controller.changePriority(priority);
            },
            child: GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 40.h,
                  decoration: getDecoration(priority),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppIcons(icon: iconNames,size: 20,),
                      SizedBox(width: 5.w,),
                      Text(
                        getTitle( priority),
                        style: AppTextStyles.darkbold16,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
