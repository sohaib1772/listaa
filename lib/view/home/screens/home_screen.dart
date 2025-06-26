import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/home/widgets/home_list_card.dart';
import 'package:listaa/view/home/widgets/home_select_proiority.dart';
import 'package:listaa/view/home/widgets/home_sliders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.homeLinerGradient),
        child: Column(
          children: [
            SizedBox(height: 80.h,),
            Expanded(
              child: HomeSliders(),
            ),
            Expanded(
              flex: 2,
              child: BottomGradinetContainer(
                horizontalPadding: 20.w,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(AppLocaleKeys.lists.tr,style: AppTextStyles.darkbold24,),
                  SizedBox(height: 10.h,),
                  HomeSelectProiority(),
                  SizedBox(height: 20.h,),
                  HomeListCard(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
