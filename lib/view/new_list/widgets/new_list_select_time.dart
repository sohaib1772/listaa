import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';

class NewListSelectTime extends StatelessWidget {
   NewListSelectTime({super.key,required this.selectedTime});

  String selectedTime;
 final NewListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
                      () => AppTextButtonsWithIcon(
                        icon: Icons.watch_later,
                        text: controller.time.value == ""
                            ? AppLocaleKeys.selectTime.tr
                            : controller.time.value,
                        onPressed: () {
                          BottomPicker.time(
                            pickerTitle: Text(
                              AppLocaleKeys.selectTime.tr,
                              style: AppTextStyles.darkbold24,
                            ),

                            onChange: (index) {
                              selectedTime = DateFormat.Hms().format(index);
                            },

                            bottomPickerTheme: BottomPickerTheme.orange,
                            initialTime: Time(
                              hours:
                                  DateTime.tryParse(
                                    "0000-00-00 ${controller.time.value}",
                                  )?.hour ??
                                  1,
                              minutes:
                                  DateTime.tryParse(
                                    "0000-00-00 ${controller.time.value}",
                                  )?.minute ??
                                  1,
                            ),
                            backgroundColor:
                                AppColors.datePickerBackgroundColor,
                            pickerTextStyle: AppTextStyles.darkbold20,
                            buttonStyle: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            use24hFormat: true,
                            buttonContent: AppTextButtons(
                              text: AppLocaleKeys.done.tr,
                              onPressed: () {
                                controller.changeTime(selectedTime ?? "");

                                Get.back();
                              },
                            ),
                          ).show(context);
                        },
                      ),
                    );
  }
}