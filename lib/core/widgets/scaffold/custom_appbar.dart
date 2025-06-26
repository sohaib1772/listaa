import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class CustomAppbar {
  static AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: AppColors.primaryTextColor,
      elevation: 0,
      bottomOpacity: 0,
      backgroundColor: Colors.white.withAlpha(0),
      title:  Text(AppLocaleKeys.welcome.tr,style: AppTextStyles.darkbold28,),
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.format_align_left,size: 30.sp,)),
    );
  }
}