import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/controller/recpice_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RecipeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: false,
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
                      AppLocaleKeys.recpiesAndTemplates.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),

            // Spacer

            // Home Slider
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            // uncompleted lists
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetX<RecipeController>(
                  init: controller,
                  initState: (_) {},
                  builder: (_) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.recipes.value.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:(){
                            Get.toNamed(
                              AppRouterKeys.newList,
                              arguments: {
                                "model": controller.recipes[index],
                              },
                            );
                          },

                          child: Container(
                            width: 327.w,
                            height: 190.h,
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(115),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                          
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.recipes[index].title,
                                  style: AppTextStyles.darkbold20,
                                ),
                                SizedBox(height: 20.h),
                                AppTextButtonsWithIcon(
                                  width: 200.w,
                                  onPressed: () {
                                    Get.toNamed(
                                      AppRouterKeys.newList,
                                      arguments: {
                                        "model": controller.recipes[index],
                                        "qr": true,
                                      },
                                    );
                                  },
                                  type: AppButtonType.floatingButton,
                                  text: AppLocaleKeys.goNow.tr,
                                  icon: Icons.arrow_forward_rounded,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
