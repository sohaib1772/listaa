import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:listaa/controller/category_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/widgets/app_text_form.dart';

class AddCategoryBottomSheet extends StatelessWidget {
   AddCategoryBottomSheet({super.key});
  final CategoryController controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppColors.allListsScreenBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: AppTextForm(
                  validator: (p0) =>
                      p0!.isEmpty ? AppLocaleKeys.titleRequired.tr : null,
                  controller: TextEditingController(),
                  hint: AppLocaleKeys.title.tr,
                  onFieldSubmitted: (value) async{
                    if (value.isEmpty) {
                      Get.snackbar(
                        AppLocaleKeys.warning.tr,
                        AppLocaleKeys.titleRequired.tr,
                        snackPosition: SnackPosition.TOP,
                      );
                      return;
                    }
                    await controller.addCategory(value);
                    Get.back();
                  },
                ),
              );
  }
}