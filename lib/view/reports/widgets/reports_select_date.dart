import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/reports_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class ReportsSelectDate extends StatelessWidget {
   ReportsSelectDate({super.key});
  final controller = Get.find<ReportsController>();
  @override
  Widget build(BuildContext context) {
    return CustomPopup(
                      arrowColor: Colors.orange,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type: ReportType.today);
                              Get.back();
                            },
                            child: Text(AppLocaleKeys.today.tr, style: AppTextStyles.darkbold20)),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type:  ReportType.currentWeek);
                              Get.back();
                            },
                            child: Text( AppLocaleKeys.currentWeek.tr, style: AppTextStyles.darkbold20)),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type:  ReportType.currentMonth);
                              Get.back();
                            },
                            child: Text( AppLocaleKeys.currentMonth.tr, style: AppTextStyles.darkbold20)),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type:  ReportType.lastMonth);
                              Get.back();
                            },
                            child: Text( AppLocaleKeys.lastMonth.tr, style: AppTextStyles.darkbold20)),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type:  ReportType.currentYear);
                              Get.back();
                            },
                            child: Text( AppLocaleKeys.currentYear.tr, style: AppTextStyles.darkbold20)),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: ()async{
                              await  controller.loadReportsByDate(type:   ReportType.all);
                              Get.back();
                            },
                            child: Text( AppLocaleKeys.all.tr, style: AppTextStyles.darkbold20)),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.bottomContainerBackgroundColor,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(controller.selectedReportType, style: AppTextStyles.darkbold16),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.primaryTextColor,
                            ),
                          ],
                        ),
                      ),
                    );
  }
}