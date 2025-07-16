import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/all_lists_controller.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/core/widgets/item_card.dart';
import 'package:listaa/core/widgets/lists_card.dart';
import 'package:listaa/core/widgets/no_data_alert.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/data/models/category_model.dart';
import 'package:listaa/view/home/widgets/home_select_proiority.dart';
import 'package:listaa/view/home/widgets/home_sliders.dart';

class ListsScreen extends StatelessWidget {
  ListsScreen({super.key});
  final AllListsController controller = Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CategoryModel? category = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: true,
      body: Container(
        color: AppColors.allListsScreenBackgroundColor,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Text(
                      category != null
                          ? category!.title.tr
                          : AppLocaleKeys.lists.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),
            // Spacer
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
            // Home Slider
            SliverToBoxAdapter(
              child:GetBuilder<AllListsController>(
                init: controller,
                builder: (_) {
                  return HomeSelectProiority(controller: controller,
                      categoryId: category?.id ?? 0);
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            // uncompleted lists
            SliverToBoxAdapter(
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetBuilder<AllListsController>(
                  init: controller,
                  initState: (_) {
                    controller.getAllLists(
                      categoryId: category?.id ?? 0,
                    );
                  },
                  builder: (_) {
                    return controller.lists.isEmpty  ? NoDataAlert(
                message: AppLocaleKeys.noListsYet.tr,
                image: "No_lists",
              ): ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.lists.value.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        return ListsCard(
                          controller: controller,
                          model: controller.lists[index],
                          toggleIsCollapse: () {
                            controller.toggleIsCollapse(index, false);
                          },
                          isCompleted: false,

                          isCollapsed: controller.lists[index].isCollapsed,
                          index: index,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: Divider(height: 20.h)),

            // completed lists
          ],
        ),
      ),
    );
  }
}
