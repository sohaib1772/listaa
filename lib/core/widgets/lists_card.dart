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

class ListsCard extends StatelessWidget {
  ListsCard({
    super.key,
    required this.title,
    required this.items,
    this.index = 1,
    required this.isCollapsed,
    required this.isCompleted,
    required this.totalPrice,
  });
  double totalPrice;
  String title;
  List<ItemCard> items;
  bool isCollapsed;
  int index;
  bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: isCollapsed
          ? _ListCardCollapsed(title: title, items: items, index: index, isCompleted: isCompleted)
          : _ListCardNotCollapsed(title: title, items: items, index: index, isCompleted: isCompleted, totalPrice: totalPrice),
    );
  }
}

class _ListCardCollapsed extends StatefulWidget {
  _ListCardCollapsed({
    super.key,
    required this.title,
    required this.items,
    required this.index,
    required this.isCompleted,
  });
  String title;
  List<ItemCard> items;
  int index;
  bool isCompleted;

  @override
  State<_ListCardCollapsed> createState() => _ListCardCollapsedState();
}

class _ListCardCollapsedState extends State<_ListCardCollapsed> {
  int finishedItems = 0;
  @override
  initState() {
    super.initState();
    finishedItems = widget.items.where((element) => element.isChecked).length;
  }

  HomeController controller = Get.find();

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
                Get.toNamed(AppRouterKeys.newList, arguments: {"model": controller.lists[widget.index]});
              },
              child: Text(widget.title, style: AppTextStyles.darkbold20)),
            Spacer(),
            IconButton(
              icon: AppIcons(icon: AppIconsName.arrowDown, size: 16),
              onPressed: () {
                controller.toggleIsCollapse(widget.index,widget.isCompleted);
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
                  value: finishedItems / widget.items.length,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$finishedItems/${widget.items.length}',
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
    super.key,
    required this.title,
    required this.items,
    required this.index,
    required this.isCompleted,
    required this.totalPrice,
  });
  double totalPrice;
  String title;
  List<ItemCard> items;
  bool isCollapsed = false;
  int index;
  bool isCompleted;
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        Row(
          children: [
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouterKeys.newList, arguments: {"model": controller.lists[index]});
              },
              child: Text(title, style: AppTextStyles.darkbold20)),
            Spacer(),
            IconButton(
              icon: Transform( // we don't have arrow up icon for now. We use arrow down and flip it :) 
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi), 
                child: AppIcons(icon: AppIconsName.arrowDown, size: 16),
              ),
              onPressed: () {
                controller.toggleIsCollapse(index,isCompleted);
              },
            ),
          ],
        ),

        Column(mainAxisSize: MainAxisSize.min, children: items),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
        Row(
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(radius: 5, backgroundColor: AppColors.blueIconColor),
            SizedBox(width: 4.w),
            Text(AppLocaleKeys.totalAmount.tr, style: AppTextStyles.darkbold20),
            Spacer(),
            Text(totalPrice.toString(), style: AppTextStyles.darkbold20),
            SizedBox(width: 4.w),
            AppIcons(icon: AppIconsName.dollar, size: 22,color: AppColors.greenIconColor,),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    ).animate().fade();
  }
}
