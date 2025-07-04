import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class HomeAddListBottomSheet extends StatelessWidget {
  HomeAddListBottomSheet({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.addNewListBottomSheetBackgroundColor,
        border: Border(
          top: BorderSide(color: AppColors.lightBorderColor, width: 2),
          left: BorderSide(color: AppColors.lightBorderColor, width: 2),
          right: BorderSide(color: AppColors.lightBorderColor, width: 2),

        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Form(
        key: formKey,
        child: TextFormField(
          onEditingComplete: () {
            if (formKey.currentState!.validate()) {
              Get.toNamed(
                AppRouterKeys.newList,
                arguments: {"title": titleController.text},
              );
            }
          },
          validator: (v) {
            if (v!.isEmpty || v.trim().isEmpty || v == " ") {
              return AppLocaleKeys.requiredField.tr;
            }
            return null;
          },
          controller: titleController,
          autofocus: true,
          textInputAction: TextInputAction.done,
          style: AppTextStyles.darkbold20,
          decoration: InputDecoration(
            suffixIcon: TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.toNamed(
                    AppRouterKeys.newList,
                    arguments: {"title": titleController.text},
                  );
                }
              },
              child: Container(
                width: 58.w,
                height: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.drawerIconButtonsbackgroundColor,
          
                ),
                child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryTextColor, size: 30.sp,),
              ),
            ),
            hint: Text(
              AppLocaleKeys.listTitle.tr,
              style: AppTextStyles.darkbold20.copyWith(color: Colors.grey),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
