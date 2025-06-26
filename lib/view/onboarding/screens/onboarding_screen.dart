import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:listaa/controller/onboarding_controller.dart';

import 'package:listaa/controller/welcome_controller.dart';

import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/onboarding/widgets/onboarding_info_and_buttons.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  OnboardingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<OnboardingController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  return SizedBox(
                    height: 100,
                    child: CarouselSlider.builder(
                      disableGesture: true,
                      carouselController: controller.carouselController,
                      itemBuilder: (context, index, realIndex) {
                        return controller.images[index];
                      },
                      itemCount: controller.images.length,
                      options: CarouselOptions(
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        height: 200.0,
                        autoPlay: false,
                        autoPlayCurve: Curves.slowMiddle,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.9,
                        pauseAutoPlayOnTouch: false,
                        pauseAutoPlayOnManualNavigate: false,
                      ),
                    ),
                  );
                },
              ),
            ),
            OnboardingInfoAndButtons(),
          ],
        ),
      ),
    );
  }
}
