import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/controller/welcome_controller.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/core/widgets/bottom_container.dart';
import 'package:listaa/view/welcome/widgets/icons_slider.dart';
import 'package:listaa/view/welcome/widgets/info_and_buttons.dart';
import 'package:listaa/view/welcome/widgets/sliding_column_grid.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  WelcomeController controller = Get.find();  

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                  print("xxxxxxxxxxxx");
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
