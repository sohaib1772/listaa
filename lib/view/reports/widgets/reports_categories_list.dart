import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:listaa/controller/reports_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class ReportsCategoriesList extends StatelessWidget {
   ReportsCategoriesList({super.key});

  final controller = Get.find<ReportsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.bottomContainerBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(controller.selectedReportType, style: AppTextStyles.darkbold20),
                    ),
                    ...controller.categoryReports.map((category) {
                      final color = controller.getCategoryColor(category.category);
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(5.r),
                                        border: Border.all(color: Colors.black, width: 1.5.w),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(category.category.tr, style: AppTextStyles.darkbold16),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(category.totalSpent.toString(), style: AppTextStyles.darkbold16),
                                    SizedBox(width: 4.w),
                                    AppIcons(
                                      icon: AppIconsName.dollar,
                                      color: AppColors.greenIconColor,
                                      size: 24.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (controller.categoryReports.indexOf(category) != controller.categoryReports.length - 1)
                            Divider(),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ));
  }
}