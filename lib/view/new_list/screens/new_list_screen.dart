import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/helper/formatter.dart';
import 'package:listaa/core/helper/qr_helper.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/services/my_services.dart';
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
  final GlobalKey qrKey = GlobalKey();

  NewListController controller = Get.find();
  ShoppingListModel? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (args['title'] != null) controller.title.value = args['title'];

    if (args['model'] == null) return;
    model = args['model'];
    controller.isEditing.value = true;
    controller.title.value = model!.title;
    final List<ItemModel> itemModels = List<ItemModel>.from(model!.items);
    controller.selectedPriority.value = model!.priority;
    print("model category id: ${model!.categoryId}");
    controller.selectedCategoryId = model!.categoryId;
    controller.date.value = model!.date.toString();
    controller.time.value = Get.find<Formatter>().time(model!.time);
    controller.items = itemModels.map((e) {
      print("is dooooooone ? :${e.isDone}");
      return RowItemsModel(
        id: e.id ?? 0,
        nameController: TextEditingController(text: e.name),
        priceController: TextEditingController(text: e.price.toString()),
        focusNode: FocusNode(),
        isDone: e.isDone,
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
                    onPressed: () async{
                       bool isGranted =  await Get.find<MyServices>().requestPermission();
                      if(!isGranted){
                        return;
                      }
                      Get.bottomSheet(
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.allListsScreenBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RepaintBoundary(
                                key: qrKey,
                                child: Container(
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.containerLinerGradient,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    children: [
                                      QrHelper.generateQrCode(
                                        json.encode(
                                          ShoppingListModel(
                                            id: model?.id ?? 0,
                                            isDeleted: false,
                                            totalPrice:
                                                controller.totalAmount.value,
                                            title: controller.title.value,
                                            date: DateTime.parse(
                                              controller.date.value,
                                            ),
                                            time: DateTime.parse(
                                              "0000-00-00 ${controller.time.value}",
                                            ),
                                            items: controller.items
                                                .map(
                                                  (e) => ItemModel(
                                                    id: e.id,
                                                    listId: model?.id ?? 0,
                                                    name: e.nameController.text,
                                                    price:
                                                        double.tryParse(
                                                          e
                                                              .priceController
                                                              .text,
                                                        ) ??
                                                        0,
                                                    isDone: e.isDone,
                                                  ),
                                                )
                                                .toList(),
                                            priority: controller
                                                .selectedPriority
                                                .value,
                                            categoryId:
                                                controller.selectedCategoryId,
                                          ).toMap(),
                                        ),
                                        200,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        AppLocaleKeys.listaApp.tr,
                                        style: AppTextStyles.darkbold20,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        controller.title.value,
                                        style: AppTextStyles.darkbold16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              AppTextButtons(
                                text: AppLocaleKeys.share.tr,
                                onPressed: () {
                                  controller.shareQrCode(qrKey: qrKey);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                    onPressed: () async {
                      await controller.delete(model?.id ?? 0);
                      Get.back();
                      await Get.find<HomeController>().getAllLists();

                      Get.back();
                    },
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
              NewListSelectCategories(controller: controller),
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
                          if (controller
                              .items
                              .first
                              .nameController
                              .text
                              .isEmpty) {
                            Get.snackbar(
                              AppLocaleKeys.warning.tr,
                              AppLocaleKeys.listShouldHaveAtLeastOneItem.tr,
                              snackPosition: SnackPosition.TOP,
                            );
                            return;
                          }
                          if (model != null) {
                            if(args["qr"] == true){
                              await controller.addNewList();
                              return;
                            }
                            await controller.updateList(model?.id ?? 0);
                            Get.snackbar(
                              AppLocaleKeys.success.tr,
                              AppLocaleKeys.listUpdatedSuccessfully.tr,
                              snackPosition: SnackPosition.TOP,
                            );
                            await Get.find<HomeController>().getAllLists();
                            return;
                          }
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
