import 'package:flutter/material.dart';

import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_date.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_priority.dart';

class NewListHeader extends StatelessWidget {
 const NewListHeader({super.key, required this.title});
 final String title;
  
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
