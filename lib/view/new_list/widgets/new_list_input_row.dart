import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/app_text_form.dart';

class NewListInputRow extends StatelessWidget {
  final int index;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final VoidCallback onDelete;
  final NewListController controller;

const  NewListInputRow({
    required this.index,
    required this.nameController,
    required this.priceController,
    required this.onDelete,
    required this.controller,
    required this.focusNode,
  });

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index > 0
                  ? TextButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        maximumSize: WidgetStatePropertyAll(Size(10, 30)),
                        minimumSize: WidgetStatePropertyAll(Size(10, 30)),
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: onDelete,
                      child: Icon(
                        Icons.remove_circle_outline_sharp,
                        color: AppColors.redIconColor,
                      ),
                    )
                  : SizedBox.shrink(),
              Expanded(
                flex: 2,
                child: AppTextForm(
                  focusNode: focusNode,
                  controller: nameController,
                  validator: (val) => null,
                  hint: AppLocaleKeys.name.tr,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    AppTextForm(
                      onChanged: (p0) {
                        controller.calTotalAmount();
                      },
                      textInputAction: TextInputAction.newline,
                      onFieldSubmitted: (val) {
                        RowItemsModel? model = controller.items
                            .where(
                              (element) => element.nameController.text.isEmpty,
                            )
                            .firstOrNull;

                        if (model != null) { // here we check if there is any empty item in the list and focus on it
                          FocusScope.of(context).requestFocus(model.focusNode);
                          return;
                        }

                        // if there is no empty item in the list we add a new item
                        controller.addNewItemToRows();
                        FocusScope.of(context).requestScopeFocus();
                      },
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      validator: (val) => null,
                      hint: AppLocaleKeys.price.tr,
                    ),
                    AppIcons(
                      icon: AppIconsName.dollar,
                      size: 30,
                      color: priceController.text.isNotEmpty ? AppColors.greenIconColor : AppColors.primaryTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1, height: 20),
      ],
    );
  }
}
