import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_date.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_priority.dart';

class NewListHeader extends StatelessWidget {
  NewListHeader({super.key, required this.title});
  String title;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.darkbold24),
        Row(
          children: [
            NewListSelectDate(),
            NewListSelectPriority(),
          ],
        ),
      ],
    );
  }
}
