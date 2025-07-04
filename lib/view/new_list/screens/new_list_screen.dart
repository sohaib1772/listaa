import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_popup/flutter_popup.dart';
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
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/app_text_form.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/view/new_list/widgets/new_list_header.dart';
import 'package:listaa/view/new_list/widgets/new_list_input_row.dart';
import 'package:listaa/view/new_list/widgets/new_list_select_categories.dart';
import 'package:listaa/view/new_list/widgets/new_list_total_amount.dart';

class NewListScreen extends StatefulWidget {
  NewListScreen({super.key});

  @override
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final args = Get.arguments;

  NewListController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (args['title'] != null) controller.title.value = args['title'];

    if (args['model'] == null) return;
    ShoppingListModel model = args['model'];
    controller.isEditing.value = true;
    controller.title.value = model.title;
    final List<ItemModel> itemModels = List<ItemModel>.from(model.items);
    controller.selectedPriority.value = model.priority;
    controller.date.value = model.date.toString();
    controller.items = itemModels.map((e) {
      return RowItemsModel(
        nameController: TextEditingController(text: e.name),
        priceController: TextEditingController(text: e.price.toString()),
        focusNode: FocusNode(),
      );
    }).toList();

    controller.calTotalAmount();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: controller.isEditing.value
          ? AppLocaleKeys.editList.tr
          : AppLocaleKeys.addNewList.tr,
      scaffoldKey: scaffoldKey,
      appBarAction: controller.isEditing.value
          ? CustomPopup(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.qr_code,
                          size: 24,
                          color: AppColors.primaryTextColor,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocaleKeys.share.tr,
                          style: AppTextStyles.darkbold16,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppIcons(icon: AppIconsName.trash, size: 24),
                        SizedBox(width: 10.w),
                        Text(
                          AppLocaleKeys.delete.tr,
                          style: AppTextStyles.darkbold16.copyWith(
                            color: AppColors.redIconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              child: Icon(Icons.more_vert, color: AppColors.primaryTextColor),
            )
          : null,
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
              NewListHeader(title: controller.title.value),
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
                        priceController:
                            controller.items[index].priceController,
                        focusNode: controller.items[index].focusNode,
                        onDelete: () => controller.removeItemFromRows(index),
                      ),
                      itemCount: controller.items.length,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              NewListTotalAmount(),
              SizedBox(height: 20.h),
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : AppTextButtons(
                        text: AppLocaleKeys.save.tr,
                        onPressed: () async {
                          await controller.addNewList();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
