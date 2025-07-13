import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/controller/category_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/localization/locale_controller.dart';
import 'package:listaa/core/widgets/add_category_bottom_sheet.dart';
import 'package:listaa/core/widgets/app_buttons.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key, required this.categoryController});
  final CategoryController categoryController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: categoryController,
      initState: (_) {
        categoryController.getAllCategories();
      },
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: GetBuilder<LocaleController>(
                init: Get.find<LocaleController>(),

                builder: (_)=> GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 56.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemCount: categoryController.categories.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final category = categoryController.categories[index];
                    return AppHomeCategoriesButton(
                      icon: category.title,
                      text: category.title.tr,
                      onPressed: () {
                        Get.toNamed(AppRouterKeys.lists, arguments: category);
                      },
                          );
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AppHomeCategoriesButton(
              width: 200.w,
              icon: AppLocaleKeys.add,
              text: AppLocaleKeys.newCategory.tr,
              onPressed: () {
                Get.bottomSheet(AddCategoryBottomSheet());
              },
            ),
          ],
        );
      },
    );
  }
}
