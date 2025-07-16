import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/recpice_controller.dart';
import 'package:listaa/core/helper/templates_helper.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/widgets/templates_cards.dart';

class HomeSliders extends StatelessWidget {
  HomeSliders({super.key});
  final RecipeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CarouselSlider.builder(
        itemCount: controller.recipes.length,
        itemBuilder: (context, index, realIndex) {
          return TemplateCard(model: controller.recipes[index]);
        },
        options: CarouselOptions(
          enlargeCenterPage: true,

          autoPlay: true,
          viewportFraction: .8,
          enableInfiniteScroll: true,
          height: 188.h,
        ),
      ),
    );
  }
}
