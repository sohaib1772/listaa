import 'package:flutter/material.dart';
import 'package:listaa/core/theme/app_colors.dart';

class AppTheme {
  static  ThemeData theme = ThemeData(
    useMaterial3: false,
    fontFamily: "cairo",
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.onboardingBackgroundColor
    )
  );
}