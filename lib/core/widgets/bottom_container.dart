import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_colors.dart';

class BottomGradinetContainer extends StatelessWidget {
  const BottomGradinetContainer({super.key,required this.content,this.horizontalPadding = 10});
 final Widget content;
 final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: 10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        
        gradient: AppColors.containerLinerGradient,
        border: Border(
          top:BorderSide(
            width: 2,
          color: AppColors.containerLinerGradientBorder,
          )
          
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: content,
    );
  }
}
