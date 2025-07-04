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
        child: GetX<HomeController>(
          init: controller,
          initState: (_) {
            controller.getAllLists();
          },
          builder:
          (controller)=> controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
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
                        icon: AppIcons(icon: AppIconsName.hamburgerMenu,size: 30,),
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
          
              // Home Slider
              SliverToBoxAdapter(
                child: SizedBox(height: 268.h, child: HomeSliders()),
              ),
          
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
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      HomeSelectProiority(horizontalPadding: 0,),
                    ],
                  ),
                ),
              ),
              // List of items (ListView -> SliverList)
              SliverToBoxAdapter(
                child: Container(
                  color: Color.fromARGB(255, 255, 250, 240),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.separated(
                      physics:
                          NeverScrollableScrollPhysics(), // مهم إذا كنت تستخدم داخل ScrollView آخر
                      shrinkWrap: true,
                      itemCount: controller.lists.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        return GetBuilder<HomeController>(
                          init: controller,
                          initState: (_) {},
                          builder: (_) {
                            return ListsCard(
                              totalPrice: controller.lists[index].totalPrice,
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
                                      onToggleCheckBox: (){
                                        controller.toggleIsDone(index, e.id ?? 0);
                                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
