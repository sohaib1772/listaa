import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class HomeSelectProiority extends StatelessWidget {
  const HomeSelectProiority({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
                    Expanded(
                      child: Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey,width: 1.5),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 2.w,),
                            Icon(Icons.flag,color: AppColors.redIconColor,),
                            SizedBox(width: 5.w,),
                            Text(AppLocaleKeys.highPriority.tr,style: AppTextStyles.darkbold16,)
                      
                          ]
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(20),
                          color: Colors.white,
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 2.w,),
                            Icon(Icons.flag,color: AppColors.blueIconColor,),
                            SizedBox(width: 5.w,),
                            Text(AppLocaleKeys.midProiority.tr,style: AppTextStyles.darkbold16,)
                      
                          ]
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(20),
                          color: Colors.white,
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 8.w,),
                            Icon(Icons.flag,color: AppColors.grayIconColor,),
                            SizedBox(width: 5.w,),
                            Text(AppLocaleKeys.lowProiority.tr,style: AppTextStyles.darkbold16,)
                      
                          ]
                        ),
                      ),
                    ),
                  ],);
  }
}