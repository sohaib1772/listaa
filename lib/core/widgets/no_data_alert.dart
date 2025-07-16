import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class NoDataAlert extends StatelessWidget {
  NoDataAlert({super.key, required this.message, required this.image});
  String message;
  String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Image.asset("assets/images/$image.png", scale: 3.0).animate().scale(
          curve: Curves.bounceOut,
          duration: Duration(seconds: 1),
        ),
        SizedBox(height: 20.h),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              message,
              textStyle: AppTextStyles.darkbold20,
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,

          isRepeatingAnimation: true,
        ),
      ],
    );
  }
}
