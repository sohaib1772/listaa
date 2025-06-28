import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class HomeSelectProiority extends StatelessWidget {
  HomeSelectProiority({super.key});
  HomeController controller = Get.find();
  BoxDecoration getDecoration(int index) {
    if (index == controller.priority.value) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.5),
      );
    }
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              controller.changePriority(0);
            },
            child: GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Container(
                  height: 30.h,
                  decoration: getDecoration(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 2.w),
                      Icon(Icons.flag, color: AppColors.redIconColor),
                      SizedBox(width: 5.w),
                      Text(
                        AppLocaleKeys.highPriority.tr,
                        style: AppTextStyles.darkbold16,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: InkWell(
            onTap: () {
              controller.changePriority(1);
            },
            child: GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Container(
                  height: 30.h,
                  decoration: getDecoration(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 2.w),
                      Icon(Icons.flag, color: AppColors.blueIconColor),
                      SizedBox(width: 5.w),
                      Text(
                        AppLocaleKeys.midPriority.tr,
                        style: AppTextStyles.darkbold16,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: InkWell(
            onTap: () {
              controller.changePriority(2);
            },
            child: GetX<HomeController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Container(
                  height: 30.h,
                  decoration: getDecoration(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 8.w),
                      Icon(Icons.flag, color: AppColors.grayIconColor),
                      SizedBox(width: 5.w),
                      Text(
                        AppLocaleKeys.lowPriority.tr,
                        style: AppTextStyles.darkbold16,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
