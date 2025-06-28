import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/view/home/widgets/home_list_card_item.dart';

class HomeListCard extends StatelessWidget {
  HomeListCard({super.key, required this.title, required this.items});
  String title;
  List<HomeListCardItem> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Row(
            children: [
              SizedBox(width: 10),
              Text(title, style: AppTextStyles.darkbold20),
            ],
          ),

          Column(mainAxisSize: MainAxisSize.min, children: items),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Row(
            children: [
              SizedBox(width: 10.w),
              CircleAvatar(radius: 5, backgroundColor: AppColors.blueIconColor),
              SizedBox(width: 4.w),
              Text(
                AppLocaleKeys.totalAmount.tr,
                style: AppTextStyles.darkbold20,
              ),
              Spacer(),
              Text("120", style: AppTextStyles.darkbold20),
              SizedBox(width: 4.w),
              Icon(Icons.monetization_on, color: AppColors.greenIconColor),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
