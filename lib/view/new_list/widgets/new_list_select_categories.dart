import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:group_button/group_button.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class NewListSelectCategories extends StatelessWidget {
  NewListSelectCategories({super.key});
 final List<String> categories = [
    AppLocaleKeys.fruitsAndVegetable.tr,
    AppLocaleKeys.holyDaysAndEvents.tr,
    AppLocaleKeys.marketAndOthers.tr,
    AppLocaleKeys.fruitsAndVegetable.tr,
    AppLocaleKeys.holyDaysAndEvents.tr,
    AppLocaleKeys.marketAndOthers.tr,
  ];
  @override
  Widget build(BuildContext context) {
    return GroupButton(
    
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
                    onSelected: (value, index, isSelected) => print(value),
                    isRadio: false,
                    buttons: categories,
    
                  );
  }
}
