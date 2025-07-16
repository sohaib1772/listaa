import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';

ButtonStyle getButtonStyle({required AppButtonType appButtonType}) {
  switch (appButtonType) {
    case AppButtonType.orange:
      return ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.orangeButtonBorderColor),
        textStyle: WidgetStatePropertyAll(
          AppTextStyles.darkbold20.copyWith(
            fontFamily: "Cairo",
            color: Colors.black,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.orangeButtonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.orangeButtonBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    case AppButtonType.light:
      return ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.lightButtonBorderColor),

        backgroundColor: WidgetStatePropertyAll(AppColors.lightButtonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.lightButtonBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    case AppButtonType.floatingButton:
      return ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          AppColors.floatingButtonBorderColor,
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.floatingButtonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(

            side: BorderSide(

              color: AppColors.floatingButtonBorderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    case AppButtonType.drawerButton:
      return ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(36.w, 36.h)),
        backgroundColor: WidgetStatePropertyAll(
          AppColors.drawerIconButtonsbackgroundColor,
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        visualDensity: VisualDensity.compact,
        elevation: WidgetStatePropertyAll(0),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(Size(36.w, 30.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
  }
}
