import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';

class NewListSelectPriority extends StatelessWidget {
  NewListSelectPriority({super.key});
  NewListController controller = Get.find();

  Widget setPriorityIcon() {
    switch (controller.selectedPriority.value) {
      case 0:
        return AppIcons(icon: AppIconsName.redFlag, size: 30);
      case 1:
        return AppIcons(icon: AppIconsName.blueFlag,size: 30);
      case 2:
        return AppIcons(icon:AppIconsName.grayFlag,size: 30);
      default:
        return AppIcons(icon: AppIconsName.redFlag,color: AppColors.primaryTextColor,size: 30,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomPopup(
        arrowColor: Colors.orange,
        barrierColor: Colors.green.withAlpha(10),
        backgroundColor: Colors.white,
        showArrow: true,

        content: SizedBox(
          width: 200.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  controller.changePriority(1);
                  Get.back();
                },
                child: Row(
                  children: [
                    AppIcons(icon: AppIconsName.redFlag, size: 30),
                    SizedBox(width: 10),
                    Text(
                      AppLocaleKeys.highPriority.tr,
                      style: AppTextStyles.darkbold16,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.changePriority(2);

                  Get.back();
                },
                child: Row(
                  children: [
                    AppIcons(icon: AppIconsName.blueFlag,size: 30),
                    SizedBox(width: 10),
                    Text(
                      AppLocaleKeys.midPriority.tr,
                      style: AppTextStyles.darkbold16,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.changePriority(3);
                  Get.back();
                },
                child: Row(
                  children: [
                    AppIcons(icon: AppIconsName.grayFlag,size: 30),
                    SizedBox(width: 10),
                    Text(
                      AppLocaleKeys.lowPriority.tr,
                      style: AppTextStyles.darkbold16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        child: setPriorityIcon(),
      ),
    );
  }
}
