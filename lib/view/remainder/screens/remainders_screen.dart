import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/controller/remainder_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/helper/formatter.dart';
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

class RemaindersScreen extends StatelessWidget {
  RemaindersScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RemainderController controller = Get.find();

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
                      AppLocaleKeys.remainders.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),
            // Spacer
            // uncompleted lists
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetBuilder<RemainderController>(
                  init: controller,
                  initState: (_) {},
                  builder: (_) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.lists.value.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (context, mainIndex) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.find<Formatter>().date(
                              controller.lists[mainIndex].date.toString(),
                              Get.locale?.languageCode ?? "ar",
                            ),
                            style: AppTextStyles.darkbold24,
                          ),
                          SizedBox(height: 10.h),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller
                                .lists[mainIndex]
                                .shoppingLists
                                .length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.h),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                     Get.find<Formatter>().time(
                                       controller
                                          .lists[mainIndex]
                                          .shoppingLists[index].time
                                     ),
                                    style: AppTextStyles.darkbold20,
                                  ),
                                  SizedBox(width: 10.w),

                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width.w *
                                        0.8,
                                    child: ListsCard(
                                      groupIndex: mainIndex,
                                      controller: controller,
                                      model: controller
                                          .lists[mainIndex]
                                          .shoppingLists[index],
                                      toggleIsCollapse: () {
                                        controller.toggleIsCollapsed(
                                          mainIndex,
                                          index,
                                        );
                                      },

                                      isCompleted: false,

                                      isCollapsed: controller
                                          .lists[mainIndex]
                                          .shoppingLists[index]
                                          .isCollapsed,
                                      index: index,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                          Divider(height: 40.h, thickness: 1.2),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: Divider(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
