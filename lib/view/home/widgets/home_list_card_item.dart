import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class HomeListCardItem extends StatelessWidget {
   HomeListCardItem({super.key,
    required this.name,
    required this.price,
    required this.isChecked,
    required this.listIndex,
    required this.itemId
    });
  String name;
  double price;
  bool isChecked;
  int listIndex;
  int itemId;
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor:  WidgetStatePropertyAll(isChecked ?  AppColors.greenIconColor:Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          visualDensity: VisualDensity.compact,
          value: isChecked,
          onChanged: (v) {
            isChecked = !isChecked;
            controller.toggleIsDone(listIndex, itemId);
          },
        ),
        Expanded(
          
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                                Text(name, style: AppTextStyles.darkbold20.copyWith(
                                  decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none
                                )),

              Spacer(),
              Text(price.toString(), style: AppTextStyles.darkbold20),
              SizedBox(width: 4),
              AppIcons(icon: AppIconsName.dollar,size: 22,color: AppColors.greenIconColor,),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
    },);
  }
}
