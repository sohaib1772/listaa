import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

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
          
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name, style: AppTextStyles.darkbold20),
                  Spacer(),
                  Text(price.toString(), style: AppTextStyles.darkbold20),
                  SizedBox(width: 4),
                  Icon(Icons.monetization_on, color: AppColors.primaryTextColor),
                  SizedBox(width: 10),
                ],
              ),
            !isChecked? SizedBox.shrink():  Positioned(
              left: 30,
              right: 0,
              bottom:15,
              top: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.primaryTextColor,
                        borderRadius: BorderRadius.circular(5),
                      )
                    ).animate().scale(
                      begin: Offset(0, 1),
                      end: Offset(1, 1),
                      alignment: Alignment.centerRight,
                      duration: 200.ms),
              ),
            ),
              
            ],
          ),
        ),
      ],
    );
    },);
  }
}
