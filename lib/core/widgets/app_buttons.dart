import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_buttons_styles.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

enum AppButtonType { orange, light, floatingButton, drawerButton }

class AppTextButtons extends StatelessWidget {
  AppTextButtons({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.orange,
    this.autoPlayAnimation = false,
    this.width = double.infinity,
  });
  double width;
  Function onPressed;
  String text;
  AppButtonType type;
  bool autoPlayAnimation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child:
          TextButton(
                style: getButtonStyle(appButtonType: type),
                onPressed: () => onPressed(),
                child: Text(text, style: AppTextStyles.darkbold20),
              )
              .animate(
                autoPlay: autoPlayAnimation,
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(duration: 2.seconds),
    );
  }
}

class AppTextButtonsWithIcon extends StatelessWidget {
  AppTextButtonsWithIcon({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.floatingButton,
    this.autoPlayAnimation = false,
    this.width = double.infinity,
    this.icon = Icons.add_box_outlined,
  });
  double width;
  Function onPressed;
  String text;
  AppButtonType type;
  bool autoPlayAnimation;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(115),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(3, 4),
          ),
        ],
      ),
      width: width.w,
      child:
          TextButton(
                style: getButtonStyle(appButtonType: type),
                onPressed: () => onPressed(),
                child: Row(
                  children: [
                    Icon(icon, color: AppColors.primaryTextColor, size: 40.sp),
                    SizedBox(width: 10.w),
                    Text(text, style: AppTextStyles.darkbold20),
                  ],
                ),
              )
              .animate(
                autoPlay: autoPlayAnimation,
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(duration: 2.seconds),
    );
  }
}

class AppDrawerIconButton extends StatelessWidget {
  AppDrawerIconButton({
    super.key,
    required this.onPressed,
    this.icon = AppIconsName.add,
  });
  Function onPressed;
  AppIconsName icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: getButtonStyle(appButtonType: AppButtonType.drawerButton),
      onPressed: () => onPressed(),
      child: AppIcons(icon: icon,size: icon == AppIconsName.close ? 18 : 24,),
    );
  }
}

class AppDrawerTextIconButton extends StatelessWidget {
  AppDrawerTextIconButton({
    super.key,
    required this.onPressed,
    this.icon = AppIconsName.doneList,
    required this.text,
  });
  Function onPressed;
  AppIconsName icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        children: [
          AppDrawerIconButton(onPressed: () {}, icon: icon),
          SizedBox(width: 15.w),
          Text(text, style: AppTextStyles.darkbold20),
        ],
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  AppIconButton({
    super.key,
    required this.onPressed,
    this.type = AppButtonType.floatingButton,
    this.autoPlayAnimation = false,
    this.width = 60,
    this.icon = Icons.add_box_outlined,
    this.iconSize = 40,
  });
  double width;
  Function onPressed;
  AppButtonType type;
  bool autoPlayAnimation;
  IconData icon;
  double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(115),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(3, 4),
          ),
        ],
      ),
      width: width.w,
      child:
          TextButton(
                style: getButtonStyle(appButtonType: type),
                onPressed: () => onPressed(),
                child: Icon(
                  icon,
                  color: AppColors.primaryTextColor,
                  size: iconSize.sp,
                ),
              )
              .animate(
                autoPlay: autoPlayAnimation,
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(duration: 2.seconds),
    );
  }
}
