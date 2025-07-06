import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class CustomAppbar {
  static PreferredSizeWidget appBar(BuildContext context, {String? title,List<Widget>? actions}) {

    return AppBar(
      
            foregroundColor: AppColors.primaryTextColor,
            elevation: 0,
            bottomOpacity: 0,
            automaticallyImplyLeading: true,
            actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
             
            ),
            backgroundColor: AppColors.appBarBackgroundColor,
            title: Text(title ?? AppLocaleKeys.welcome.tr, style: AppTextStyles.darkbold20),
            leading: Navigator.canPop(context) ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
              ) : SizedBox.shrink(),
            actions: actions,
          );
  }
}
