import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_buttons_styles.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

enum AppButtonType { orange, light , floatingButton}

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
    return SizedBox(
      width: width.w,
      child:
          TextButton(
                style: getButtonStyle(appButtonType: type),
                onPressed: () => onPressed(),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: AppColors.primaryTextColor,
                      size: 40.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
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


