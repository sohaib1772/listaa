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
  HomeSelectProiority({super.key, this.horizontalPadding = 20,required this.controller,this.categoryId = 0});
  double horizontalPadding;
  int categoryId;
  final controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: horizontalPadding.w),
          SelectPriorityButton(
            categoryId: categoryId,
            controller: controller,
            iconNames: AppIconsName.all,priority: 10,),
          SizedBox(width: 5.w),
          SelectPriorityButton(
              categoryId: categoryId,
            controller: controller,
            iconNames: AppIconsName.redFlag,priority: 0,
            
          ),
          SizedBox(width: 5.w),
          SelectPriorityButton(
            categoryId: categoryId,
            controller: controller,
            iconNames: AppIconsName.blueFlag,priority: 1,
        
          ),
          SizedBox(width: 5.w),
          SelectPriorityButton(
            categoryId: categoryId,
            controller: controller,
            iconNames: AppIconsName.grayFlag,priority: 2,
           
          ),
          SizedBox(width: horizontalPadding.w),
        ],
      ),
    );
  }
}

class SelectPriorityButton<T> extends StatelessWidget {
   SelectPriorityButton({super.key,required this.iconNames,required this.priority,required this.controller,this.categoryId = 0});

  final controller;
  AppIconsName iconNames;
  int priority;
  BoxDecoration getDecoration(int index) {
    if (index == controller.priority) {
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
      case 10:
        return AppLocaleKeys.allPriority.tr;
      case 0:
        return AppLocaleKeys.highPriority.tr;
      case 1:
        return AppLocaleKeys.midPriority.tr;
      case 2:
        return AppLocaleKeys.lowPriority.tr;
      default:
        return AppLocaleKeys.allPriority.tr;
    }
  }
  int categoryId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              controller.changePriority(priority,categoryId: categoryId);
            },
            child: GetBuilder(
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
