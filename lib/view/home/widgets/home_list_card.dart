import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class HomeListCard extends StatelessWidget {
  const HomeListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("سهرة الخميس",style: AppTextStyles.darkbold20,),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStatePropertyAll(AppColors.greenIconColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              visualDensity: VisualDensity.compact,
                              value: true, onChanged: (v){}),
                            Text("🍿 فشار",style: AppTextStyles.darkbold20,),
                            Spacer(),
                            Text("120",style: AppTextStyles.darkbold20),
                            SizedBox(width: 4,),
                            Icon(Icons.monetization_on,color: AppColors.primaryTextColor),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStatePropertyAll(AppColors.greenIconColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              visualDensity: VisualDensity.compact,
                              value: true, onChanged: (v){}),
                            Text("🥜 مكسرات",style: AppTextStyles.darkbold20,),
                            Spacer(),
                            Text("120",style: AppTextStyles.darkbold20),
                            SizedBox(width: 4,),
                            Icon(Icons.monetization_on,color: AppColors.primaryTextColor,),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStatePropertyAll(AppColors.greenIconColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              visualDensity: VisualDensity.compact,
                              value: true, onChanged: (v){}),
                            Text("🧃 حليب يوم الجمعة",style: AppTextStyles.darkbold20,),
                            Spacer(),
                            Text("120",style: AppTextStyles.darkbold20),
                            SizedBox(width: 4,),
                            Icon(Icons.monetization_on,color: AppColors.primaryTextColor),
                            SizedBox(width: 10,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10.w,),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: AppColors.blueIconColor,
                            ),
                            SizedBox(width: 4.w,),
                            Text("الاجمالي",style: AppTextStyles.darkbold20,),
                            Spacer(),
                            Text("120",style: AppTextStyles.darkbold20),
                            SizedBox(width: 4.w,),
                            Icon(Icons.monetization_on,color: AppColors.greenIconColor),
                            SizedBox(width: 10.w,),
                          ],
                        ),
                        SizedBox(height: 15.h,),
                      ],

                    ),
                  );
  }
}