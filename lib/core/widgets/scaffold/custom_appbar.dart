import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class CustomAppbar {
  static final HomeController _controller = Get.find();

  static PreferredSizeWidget appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(() => AppBar(
            foregroundColor: AppColors.primaryTextColor,
            elevation: 0,
            bottomOpacity: 0,
            backgroundColor: AppColors.drawerIconButtonsbackgroundColor.withAlpha(_controller.scrollAlpha.value),
            title: Text(AppLocaleKeys.welcome.tr, style: AppTextStyles.darkbold28),
          )),
    );
  }
}
