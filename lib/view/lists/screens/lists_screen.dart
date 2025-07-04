import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/core/widgets/item_card.dart';
import 'package:listaa/core/widgets/lists_card.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/home/widgets/home_select_proiority.dart';
import 'package:listaa/view/home/widgets/home_sliders.dart';

class ListsScreen extends StatelessWidget {
  ListsScreen({super.key});
  final HomeController controller = Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: true,
      body: Container(
        color: AppColors.allListsScreenBackgroundColor,
        child: CustomScrollView(
          
          slivers: [
            SliverAppBar(
              pinned: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.allListsScreenBackgroundColor,
              foregroundColor: AppColors.primaryTextColor,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: AppColors.appBarLinerGradient,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
                    ),
                    Text(
                      AppLocaleKeys.lists.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                    
                  ],
                ),
              ),
            ),
            // Spacer
            SliverToBoxAdapter(
              child: SizedBox(height: 30.h),
            ),
            // Home Slider
            SliverToBoxAdapter(
              
              child: HomeSelectProiority(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            // uncompleted lists
            SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.separated(
                    physics:
                        NeverScrollableScrollPhysics(), 
                    shrinkWrap: true,
                    itemCount: controller.lists.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (context, index) {
                      return GetBuilder<HomeController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return ListsCard(
                            isCompleted: false,
                            title: controller.lists[index].title,
                            items: controller.lists[index].items
                                .map(
                                  (e) => ItemCard(
                                    name: e.name,
                                    price: e.price,
                                    isChecked: e.isDone,
                                    listIndex: index,
                                    itemId: e.id ?? 0,
                                    onToggleCheckBox: (){},
                                  ),
                                )
                                .toList(),
                            isCollapsed: controller.lists[index].isCollapsed,
                            index: index,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
              child: Divider(height: 20.h),
            ),
              SliverToBoxAdapter(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:  20.w),
                child: Text(AppLocaleKeys.completedLists.tr, style: AppTextStyles.darkbold24,),
              )
            ),

            // completed lists
            SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.separated(
                    physics:
                        NeverScrollableScrollPhysics(), 
                    shrinkWrap: true,
                    itemCount: controller.completedLists.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (context, index) {
                      return GetBuilder<HomeController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return ListsCard(
                            isCompleted: true,
                            title: controller.completedLists[index].title,
                            items: controller.completedLists[index].items
                                .map(
                                  (e) => ItemCard(
                                    name: e.name,
                                    price: e.price,
                                    isChecked: e.isDone,
                                    listIndex: index,
                                    itemId: e.id ?? 0,
                                    onToggleCheckBox: () {

                                    },
                                  ),
                                )
                                .toList(),
                            isCollapsed: controller.completedLists[index].isCollapsed,
                            index: index,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
