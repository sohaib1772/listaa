import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: true,
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
                      onPressed: () {
                        Get.back();
                      },
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
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocaleKeys.add.tr,
                          style: AppTextStyles.darkbold20,
                        ),
                        Text(
                          AppLocaleKeys.yes.tr,
                          style: AppTextStyles.darkbold20,
                        ),
                      ],
                    ),
                    Stack(
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
                              sections: showingSections(),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 55.r,
                          backgroundColor: AppColors.primaryTextColor,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                              "421",
                              style: AppTextStyles.darkbold20.copyWith(color: Colors.white),
                            ),
                            AppIcons(
                              color:AppColors.greenIconColor,
                              icon: AppIconsName.dollar,
                              size: 24.sp,
                            )
                          ])
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PieChartSectionData> showingSections() {
  return List.generate(4, (i) {
    final fontSize = 16.0;
    final radius = 30.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: AppColors.redIconColor,
          value: 40,
          title: '40%',
          radius: radius,
          titleStyle: AppTextStyles.darkbold16,
        );
      case 1:
        return PieChartSectionData(
          color: AppColors.blueIconColor,
          value: 30,
          title: '30%',
          radius: radius,
          titleStyle: AppTextStyles.darkbold16,
        );
      case 2:
        return PieChartSectionData(
          color: AppColors.greenIconColor,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: AppTextStyles.darkbold16,
        );
      case 3:
        return PieChartSectionData(
          color: AppColors.grayIconColor,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: AppTextStyles.darkbold16,
        );
      default:
        throw Error();
    }
  });
}
