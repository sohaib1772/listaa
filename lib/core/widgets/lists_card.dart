import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/item_card.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

class ListsCard extends StatelessWidget {
  const ListsCard({
    super.key,
    this.index = 1,
    required this.isCollapsed,
    required this.isCompleted,
    required this.toggleIsCollapse,
    required this.model,
    required this.controller,
    this.groupIndex = -1,
  });
  final bool isCollapsed;
  final int index;
  final int groupIndex;
  final bool isCompleted;
  final Function toggleIsCollapse;
  final ShoppingListModel model;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(65),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: isCollapsed
          ? _ListCardCollapsed(
              index: index,
              isCompleted: isCompleted,
              toggleIsCollapse: toggleIsCollapse,
              model: model,
            )
          : _ListCardNotCollapsed(
              groupIndex: groupIndex,
              controller: controller,
              index: index,
              isCompleted: isCompleted,
              toggleIsCollapse: toggleIsCollapse,
              model: model,
            ),
    );
  }
}

class _ListCardCollapsed extends StatefulWidget {
  const _ListCardCollapsed({
    required this.index,
    required this.isCompleted,
    required this.toggleIsCollapse,
    required this.model,
  });
  final int index;
  final bool isCompleted;
  final Function toggleIsCollapse;
  final ShoppingListModel model;

  @override
  State<_ListCardCollapsed> createState() => _ListCardCollapsedState();
}

class _ListCardCollapsedState extends State<_ListCardCollapsed> {
  int finishedItems = 0;
  @override
  initState() {
    super.initState();
    finishedItems = widget.model.items
        .where((element) => element.isDone)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        Row(
          children: [
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRouterKeys.newList,
                  arguments: {"model": widget.model},
                );
              },
              child: Text(widget.model.title.tr, style: AppTextStyles.darkbold20),
            ),
            Spacer(),
            IconButton(
              icon: AppIcons(icon: AppIconsName.arrowDown, size: 16),
              onPressed: () {
                widget.toggleIsCollapse();
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(5),
                  minHeight: 8.h,
                  backgroundColor: Colors.grey,
                  color: AppColors.greenIconColor,
                  value: finishedItems / widget.model.items.length,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$finishedItems/${widget.model.items.length}',
                style: AppTextStyles.darkbold20,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    ).animate().fade();
  }
}

class _ListCardNotCollapsed extends StatelessWidget {
  _ListCardNotCollapsed({
    required this.index,
    required this.isCompleted,
    required this.toggleIsCollapse,
    required this.model,
    required this.controller,
    this.groupIndex = -1,
  });
  final bool isCollapsed = false;
  final int index;
  final bool isCompleted;
  final int groupIndex;
  final Function toggleIsCollapse;
  final ShoppingListModel model;
  final controller;

  Widget getPriorityFlag(int index) {
    switch (index) {
      case 10:
        return AppIcons(icon: AppIconsName.all);
      case 2:
        return AppIcons(icon: AppIconsName.redFlag);
      case 1:
        return AppIcons(icon: AppIconsName.blueFlag);
      case 0:
        return AppIcons(icon: AppIconsName.grayFlag);
      default:
        return AppIcons(icon: AppIconsName.all);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10.w),
        Row(
          children: [
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouterKeys.newList, arguments: {"model": model});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getPriorityFlag(model.priority),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      model.title.tr,
                      style: AppTextStyles.darkbold20.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Transform(
                // we don't have arrow up icon for now. We use arrow down and flip it :)
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi),
                child: AppIcons(icon: AppIconsName.arrowDown, size: 16),
              ),
              onPressed: () {
                toggleIsCollapse();
              },
            ),
          ],
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: model.items.map((e) {
            return ItemCard(
             groupIndex:groupIndex,
              controller: controller,
              onToggleCheckBox: () {},
              name: e.name,
              price: e.price,
              isChecked: e.isDone,
              listIndex: index,
              itemId: e.id ?? 0,
            );
          }).toList(),
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Divider(),
        ),
        Row(
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(radius: 5, backgroundColor: AppColors.blueIconColor),
            SizedBox(width: 4.w),
            Text(AppLocaleKeys.totalAmount.tr, style: AppTextStyles.darkbold20),
            Spacer(),
            Text(model.totalPrice.toString(), style: AppTextStyles.darkbold20),
            SizedBox(width: 4.w),
            AppIcons(
              icon: AppIconsName.dollar,
              size: 22,
              color: AppColors.greenIconColor,
            ),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    ).animate().fade();
  }
}
