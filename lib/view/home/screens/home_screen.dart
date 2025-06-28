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
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/home/widgets/home_list_card.dart';
import 'package:listaa/view/home/widgets/home_list_card_item.dart';
import 'package:listaa/view/home/widgets/home_select_proiority.dart';
import 'package:listaa/view/home/widgets/home_sliders.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.homeLinerGradient),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,

              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            // Spacer
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),

            // Home Slider
            SliverToBoxAdapter(
              child: SizedBox(height: 200.h, child: HomeSliders()),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(
                child: BottomGradinetContainer(
                  horizontalPadding: 20.w,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocaleKeys.lists.tr,
                        style: AppTextStyles.darkbold24,
                      ),
                      SizedBox(height: 10.h),
                      HomeSelectProiority(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
            // List of items (ListView -> SliverList)
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return HomeListCard(
                    title: "سهر الخميس",
                    items: [
                      HomeListCardItem(
                        name: "فشار",
                        isChecked: false,
                        price: 100,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  double get minExtent => 130.h; // أقل ارتفاع
  @override
  double get maxExtent => 130.h; // نفس الأعلى إذا كنت تريد ثبات الحجم

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white, // يمكن تعديله حسب الخلفية
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
