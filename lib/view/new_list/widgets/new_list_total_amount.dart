import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class NewListTotalAmount extends StatelessWidget {
   NewListTotalAmount({super.key});
  NewListController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Obx(() {
                 return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(115),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(3, 4),
                        ),
                      ]
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 5.r,
                          backgroundColor: AppColors.blueIconColor,
                        ),
                        SizedBox(width: 10.w,),
                        Text(AppLocaleKeys.totalAmount.tr,style: AppTextStyles.darkMedium19),
                        Spacer(),
      
                        Text(controller.totalAmount.value.toString(),style: AppTextStyles.darkbold20),
                        AppIcons(icon: AppIconsName.dollar,size: 30,color: AppColors.greenIconColor,)
                      ]
                    ),
                  );
                }),
    );
  }
}