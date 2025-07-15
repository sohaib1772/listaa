import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/recpice_controller.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/constants/app_router_keys.dart';

class HomeSliders extends StatelessWidget {
   HomeSliders({super.key});
 final RecipeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>CarouselSlider.builder(

                itemCount: controller.recipes.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 327.w,
                    height: 168.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(115),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        controller.recipes[index].title,
                        style: AppTextStyles.darkbold20,
                      ),
                      SizedBox(height: 20.h),
                      AppTextButtonsWithIcon(

                        width: 200.w,
                        onPressed: () {
                          Get.toNamed(AppRouterKeys.newList,
                              arguments: {"model": controller.recipes[index], "qr": true});
                        },
                        type: AppButtonType.floatingButton,
                        text: AppLocaleKeys.goNow.tr,
                        icon: Icons.arrow_forward_rounded,
                      ),

                      ]
                    ),
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,

                  autoPlay: true,
                  viewportFraction: .8,
                  enableInfiniteScroll: true,
                  height: 168.h

                ),
              )
    );
  }
}