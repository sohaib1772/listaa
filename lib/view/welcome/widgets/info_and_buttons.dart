import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/bottom_container.dart';

class InfoAndButtons extends StatelessWidget {
   InfoAndButtons({super.key});

  MyServices myServices = Get.find();
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
              Text(
                AppLocaleKeys.listaApp.tr,
                style: AppTextStyles.darkExtraBold30,
              ),
              Text(
                AppLocaleKeys.yourBestChoiceForShopping.tr,
                style: AppTextStyles.darkMedium19,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              AppTextButtons(
                autoPlayAnimation: true,
                text: AppLocaleKeys.goNow.tr,
                onPressed: () {
                   myServices.sharedPreferences.setBool("firstTime", true);
                 Get.offAllNamed(AppRouterKeys.home);
                },
                type: AppButtonType.orange,
              ),
              SizedBox(height: 30,),
             
              
            ],
          ),
        ),
      ),
    );
  }
}