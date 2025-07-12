import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/helper/notifications_helper.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:listaa/core/theme/app_buttons_styles.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_time.dart';

class NewListSelectDate extends StatelessWidget {
  NewListSelectDate({super.key});
  NewListController controller = Get.find();
  String selectedDate = '';
  String selectedTime = "";
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        onPressed: ()async {
         bool isGranted =  await  NotificationsHelper.requestPermission();

        if(!isGranted){
          return;
        }
          Get.bottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [],
                color: AppColors.datePickerBackgroundColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocaleKeys.date.tr,
                      style: AppTextStyles.darkbold20,
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(115),
                            spreadRadius: 3,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Obx(
                        () => CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            controlsHeight: 20.h,
                            calendarType: CalendarDatePicker2Type.single,
                            selectedDayTextStyle: AppTextStyles.darkbold20,
                            dayTextStyle: AppTextStyles.darkbold20,
                          ),
                          value: [
                            DateTime.tryParse(controller.date.value) ??
                                DateTime.now(),
                          ],

                          onValueChanged: (dates) {
                            selectedDate = dates.first.toString();
                            controller.changeDate(selectedDate);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    NewListSelectTime(selectedTime: selectedTime),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextButtons(
                            text: AppLocaleKeys.save.tr,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: AppTextButtons(
                            type: AppButtonType.light,
                            text: AppLocaleKeys.reset.tr,
                            onPressed: () {
                              selectedDate = "";
                              selectedTime = "";
                              controller.changeDate("");
                              controller.changeTime("");
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        icon: AppIcons(
          icon: AppIconsName.clock,
          size: 24,
          color: controller.date.value.isNotEmpty
              ? AppColors.redIconColor
              : AppColors.primaryTextColor,
        ),
      ),
    );
  }
}
