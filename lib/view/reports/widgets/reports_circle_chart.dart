import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:listaa/controller/reports_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class ReportsCircleChart extends StatelessWidget {
   ReportsCircleChart({super.key});
  final controller = Get.find<ReportsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 200.h,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(),
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 0,
                              centerSpaceRadius: 60,
                              sections: controller.pieSections,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 55.r,
                          backgroundColor: AppColors.darkBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(() => Text(
                                controller.totalSpent.toInt().toString(),
                                style: AppTextStyles.darkbold20.copyWith(
                                  color: Colors.white,
                                ),
                              )),
                              SizedBox(width: 4.w),
                              AppIcons(
                                color: AppColors.greenIconColor,
                                icon: AppIconsName.dollar,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
  }
}