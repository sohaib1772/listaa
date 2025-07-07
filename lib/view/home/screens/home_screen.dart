import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/core/widgets/item_card.dart';
import 'package:listaa/core/widgets/lists_card.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';

import 'package:listaa/view/home/widgets/home_select_proiority.dart';
import 'package:listaa/view/home/widgets/home_sliders.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
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
              backgroundColor: Colors.white,
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
                        scaffoldKey.currentState!.openDrawer();
                      },
                      icon: AppIcons(
                        icon: AppIconsName.hamburgerMenu,
                        size: 30,
                      ),
                    ),
                    Text(
                      AppLocaleKeys.welcome.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        // scaffoldKey.currentState!.openDrawer();
                      },
                      icon: AppIcons(
                        icon: AppIconsName.notifications,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer
            SliverToBoxAdapter(child: SizedBox(height: 60.h)),

            // Home Slider
            // SliverToBoxAdapter( /// TODO:: add it in next update after upload it to store
            //   child: SizedBox(height: 268.h, child: HomeSliders()),
            // ),
            SliverToBoxAdapter(
              child: BottomGradinetContainer(
                horizontalPadding: 20.w,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocaleKeys.lists.tr,
                          style: AppTextStyles.darkbold24,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRouterKeys.lists);
                          },
                          child: Text(
                            AppLocaleKeys.more.tr,
                            style: AppTextStyles.darkbold20.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    GetBuilder<HomeController>(
                      builder:(_)=> HomeSelectProiority(
                        controller: controller,
                        horizontalPadding: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // List of items (ListView -> SliverList)
            SliverToBoxAdapter(
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.lists.value.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        return ListsCard(
                          controller: controller,
                          model: controller.lists[index],
                          toggleIsCollapse: () {
                            controller.toggleIsCollapse(index);
                          },
                          isCompleted: false,

                          isCollapsed: controller.lists[index].isCollapsed,
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: Divider(height: 20.h)),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                ),
                child: AppTextButtonsWithIcon(
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    Get.toNamed(AppRouterKeys.lists);
                  },
                  text: AppLocaleKeys.more.tr,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 40.h)),
          ],
        ),
      ),
    );
  }
}
