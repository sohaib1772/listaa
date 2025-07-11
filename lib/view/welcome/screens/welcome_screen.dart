import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:listaa/controller/welcome_controller.dart';
import 'package:listaa/core/theme/app_colors.dart';

import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';

import 'package:listaa/view/welcome/widgets/info_and_buttons.dart';
import 'package:listaa/view/welcome/widgets/sliding_column_grid.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
final  WelcomeController controller = Get.find();  

final  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.onboardingBackgroundColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GetBuilder<WelcomeController>(
              builder: (controller) {
                if (controller.startSlidersAnimation) {
                  return InfiniteBoxAnimation();
                }
                return Container();
              },
            ),

            InfoAndButtons(

            ),
          ],
        ),
      ),
    );
  }
}
