import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listaa/controller/category_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/add_category_bottom_sheet.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/app_text_form.dart';

class DrawerCategories extends StatelessWidget {
  DrawerCategories({super.key});

  final CategoryController controller = Get.find<CategoryController>();
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 230.h,
          child: GetBuilder<CategoryController>(
            initState: (_) {
              controller.getAllCategories();
            },
            builder: (controller) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return AppDrawerTextIconButton(
                    onLongPress: (){
                      Get.bottomSheet(
                        
                        Container(
                          height: 250.h,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.allListsScreenBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocaleKeys.deleteCategoryConfirmation.tr,
                                style: AppTextStyles.darkbold20,
                              ),
                              SizedBox(height: 20.h),
                              Column(
                                children: [
                                  AppTextButtons(
                                    type: AppButtonType.floatingButton,
                                    text: AppLocaleKeys.cancel.tr,
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(height: 10.h),
                                  AppTextButtons(

                                    type: AppButtonType.floatingButton,
                                    text: AppLocaleKeys.delete.tr,
                                    onPressed: () async {
                                      print(controller.categories[index].id);
                                      await controller.deleteCategory(controller.categories[index].id ?? 0);
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onPressed: () {},
                    text: controller.categories[index].isDefault
                        ? controller.categories[index].title.tr
                        : controller.categories[index].title,
                    icon: controller.getDeafultCategoryIcon(
                      controller.categories[index].title,
                    ),
                  );
                },
                itemCount: controller.categories.length,
              );
            },
          ),
        ),

        AppDrawerTextIconButton(
          icon: AppIconsName.add,
          onPressed: () {
            Get.bottomSheet(
              AddCategoryBottomSheet()
            );
          },
          text: AppLocaleKeys.newCategory.tr,
        ),
      ],
    );
  }
}
