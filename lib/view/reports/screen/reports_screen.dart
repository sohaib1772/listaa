import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listaa/controller/reports_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/reports/widgets/reports_categories_list.dart';
import 'package:listaa/view/reports/widgets/reports_circle_chart.dart';
import 'package:listaa/view/reports/widgets/reports_select_date.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final ReportsController controller = Get.find();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAll('monthly');
    });

    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: false,
      body: Container(
        color: AppColors.allListsScreenBackgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.allListsScreenBackgroundColor,
              foregroundColor: AppColors.primaryTextColor,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: AppColors.appBarLinerGradient,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Text(
                      AppLocaleKeys.moneyReports.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    ReportsCircleChart(),
                    SizedBox(height: 20.h),
                    ReportsSelectDate(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ReportsCategoriesList(),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40.h)),
            SliverToBoxAdapter(
              child: Obx(() => Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 6.h,
                  horizontal: 40.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('الإجمالي', style: AppTextStyles.darkbold24),
                    Row(
                      children: [
                        Text(controller.totalSpent.toInt().toString(), style: AppTextStyles.darkbold24),
                        SizedBox(width: 10.w),
                        AppIcons(
                          icon: AppIconsName.dollar,
                          color: AppColors.greenIconColor,
                          size: 30.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
          ],
        ),
      ),
    );
  }
}