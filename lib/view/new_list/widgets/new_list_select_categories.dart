import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:group_button/group_button.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class NewListSelectCategories extends StatelessWidget {
 final NewListController controller;
  NewListSelectCategories({super.key, required this.controller});
 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewListController>(
      init: controller,
      initState: (x){
        print("selected category id: ${controller.selectedCategoryId}");
      },
      builder:(controller)=> GroupButton(
        controller: GroupButtonController(
      
          selectedIndex: controller.categories.indexWhere((e) => e.id == controller.selectedCategoryId),
          
        ),
        options: GroupButtonOptions(
      
          elevation: 0,
          direction: Axis.horizontal,
          groupRunAlignment: GroupRunAlignment.start,
          alignment: AlignmentDirectional.topStart,
          mainGroupAlignment: MainGroupAlignment.start,
          borderRadius: BorderRadius.circular(20),
          groupingType: GroupingType.wrap,
          spacing: 10,
          runSpacing: 0,
          unselectedTextStyle: AppTextStyles.lightDarkbold16,
          selectedTextStyle: AppTextStyles.lightDarkbold16,
          selectedColor: AppColors.appBarBackgroundColor,
          unselectedColor: Colors.white,
          selectedBorderColor: AppColors.primaryTextColor,
          unselectedBorderColor: AppColors.primaryTextColor,
        ),
        onSelected: (value, index, isSelected) {
          controller.selectedCategoryId = controller.categories[index].id ?? 0;
        },
        isRadio: true,
        maxSelected: 1,
      
      
        buttons: controller.categories.map((e) {
          return e.isDefault ?  
            e.title.tr :
            e.title;
        }).toList(),
      ),
    );
  }
}
