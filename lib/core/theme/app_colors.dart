import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  //onboarding
  static const Color onboardingBackgroundColor = Color(0xFFF5B041);

  static const Color onboardingPrimaryButtonFillColor = Color(0xFFF5B041);
  static const Color onboardingPrimaryButtonBorderColor = Color(0xFFFFCC5D);

  static const Color onboardingSecondaryButtonFillColor = Color(0xFFF5B041);
  static const Color onboardingSecondaryButtonBorderColor = Color(0xFFFFCC5D);
  //----------------

  // gradient container
  static const LinearGradient containerLinerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    stops: [0, 2],

    colors: [Color.fromARGB(212, 255, 224, 156), Color(0xFFFFF8E7)],
  );

  static const LinearGradient drawerLinerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    stops: [0, 0.3],

    colors: [Color(0xFFF5B041), Color(0xFFFFFFFF)],
  );

   // gradient container 
 
 static const LinearGradient appBarLinerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,

    colors: [Color(0xFFF5B041), Color(0xFFFFF8E7)],
  );
  static const Color containerLinerGradientBorder = Color.fromARGB(21, 0, 0, 0);
  //----------------

  // text styles colors

  static const Color primaryTextColor = Color(0xFF333333);
  static const Color secondaryTextColor = Color(0xFF000000);

  //----------------

  //buttons colors

  static const Color lightButtonColor = Color(0xFFFDEFD9);
  static const Color lightButtonBorderColor = Color(0xFFFDECCD);

  static const Color orangeButtonColor = Color(0xFFF5B041);
  static const Color orangeButtonBorderColor = Color(0xFFFFCC5D);

  static const Color floatingButtonColor = Color(0xFFF6BC5D);
  static const Color floatingButtonBorderColor = Color.fromARGB(68, 1, 1, 1);

  static const Color drawerIconButtonsbackgroundColor = Color(0xFFF6CE8B);

  //----------------

  //icons colors

  static const Color redIconColor = Color(0xFFB13E3E);
  static const Color blueIconColor = Color(0xFF2C5783);
  static const Color grayIconColor = Color(0xFF3F5F6D);
  static const Color greenIconColor = Color(0xFF006A6F);

  // backgrounds
  static const Color appBarBackgroundColor = Color(0xFFFFEBC9);
  static const Color listScreenBackgroundColor = Color(0xFFFFF0D8);
  static const Color allListsScreenBackgroundColor = Color(0xFFFFF8E7);
  static const Color datePickerBackgroundColor = Color(0xFFF6DCB0);
  static const Color addNewListBottomSheetBackgroundColor = Color(0xFFfff8e8);

  // borders 

  static const Color lightBorderColor = Color(0xFFCCC6BA);
}
