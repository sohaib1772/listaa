import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:group_button/group_button.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_text_form.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/new_list/widgets/new_list_header.dart';
import 'package:listaa/view/new_list/widgets/new_list_input_row.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_categories.dart';
import 'package:listaa/view/new_list/widgets/new_list_total_amount.dart';

class NewListScreen extends StatelessWidget {
  NewListScreen({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final args = Get.arguments;
  NewListController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: AppLocaleKeys.addNewList.tr,
      scaffoldKey: scaffoldKey,
      showAppbar: true,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        color: AppColors.listScreenBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewListHeader(
                title: args['title'],
              ),
              NewListSelectCategories(),
              SizedBox(
                height: 300.h,
                child: GetBuilder<NewListController>(
                  builder: (controller) {
                    return ListView.builder(                
                      itemBuilder: (context, index) => NewListInputRow(
                        controller: controller,
                        index: index,
                        nameController: controller.items[index].nameController,
                        priceController: controller.items[index].priceController,
                        focusNode: controller.items[index].focusNode,
                        onDelete: () => controller.removeItemFromRows(index),
                      ),
                      itemCount: controller.items.length,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h,),
              NewListTotalAmount(),
              SizedBox(height: 20.h,),
              AppTextButtons(text: AppLocaleKeys.save.tr, onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
