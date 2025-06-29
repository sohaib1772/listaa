import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/view/home/widgets/home_list_card_item.dart';

class HomeListCard extends StatelessWidget {
  HomeListCard({
    super.key,
    required this.title,
    required this.items,
    this.index = 1,
    required this.isCollapsed,
  });
  String title;
  List<HomeListCardItem> items;
  bool isCollapsed;
  int index;
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
          ? _HomeListCardCollapsed(title: title, items: items,index: index,)
          : _HomeListCardNotCollapsed(title: title, items: items, index: index),
    );
  }
}

class _HomeListCardCollapsed extends StatefulWidget {
  _HomeListCardCollapsed({
    super.key,
    required this.title,
    required this.items,
    required this.index,
  });
  String title;
  List<HomeListCardItem> items;
  int index;

  @override
  State<_HomeListCardCollapsed> createState() => _HomeListCardCollapsedState();
}

class _HomeListCardCollapsedState extends State<_HomeListCardCollapsed> {
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
            Text(widget.title, style: AppTextStyles.darkbold20),
            Spacer(),
            IconButton(
              icon: Icon(
                
                Icons.arrow_drop_down_outlined,
              ),
              onPressed: () {
                controller.toggleIsCollapse(widget.index);
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

class _HomeListCardNotCollapsed extends StatelessWidget {
  _HomeListCardNotCollapsed({
    super.key,
    required this.title,
    required this.items,
    required this.index,
  });
  String title;
  List<HomeListCardItem> items;
  bool isCollapsed = false;
  int index;
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
            Text(title, style: AppTextStyles.darkbold20),
            Spacer(),
            IconButton(
              icon: Icon(
                 Icons.arrow_drop_up_outlined
              ),
              onPressed: () {
                controller.toggleIsCollapse(index);
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
            Text("120", style: AppTextStyles.darkbold20),
            SizedBox(width: 4.w),
            Icon(Icons.monetization_on, color: AppColors.greenIconColor),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    ).animate().fade();
  }
}
