import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/controller/onboarding_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/bottom_container.dart';

class OnboardingInfoAndButtons extends StatelessWidget {
  OnboardingInfoAndButtons({super.key});

  OnboardingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(
          duration: Duration(milliseconds: 300),
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ),
      ],
      child: BottomGradinetContainer(
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              GetX<OnboardingController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      Text(
                        controller.titles[controller.pageIndex.value],
                        style: AppTextStyles.darkExtraBold30,
                      ),
                      Text(
                        controller.subtitles[controller.pageIndex.value],
                        style: AppTextStyles.darkMedium19,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CircleAvatar(
                              maxRadius: 5,
                              backgroundColor:
                                  index == controller.pageIndex.value
                                  ? AppColors.primaryTextColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              GetBuilder<OnboardingController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      AppTextButtons(
                        autoPlayAnimation: true,
                        text: controller.isLastPage
                            ? AppLocaleKeys.goNow.tr
                            : AppLocaleKeys.next.tr,
                        onPressed: () {
                          controller.isLastPage
                              ? Get.offAllNamed(AppRouterKeys.home)
                              : controller.nextPage();
                        },
                        type: AppButtonType.orange,
                      ),
                      SizedBox(height: 10),
                      controller.isLastPage
                          ? Container()
                          : AppTextButtons(
                              text: AppLocaleKeys.skip.tr,
                              onPressed: () {
                                Get.offAllNamed(AppRouterKeys.home);
                              },
                              type: AppButtonType.light,
                            ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
