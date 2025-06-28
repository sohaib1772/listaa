import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/drawer/app_drawer.dart';
import 'package:listaa/core/widgets/scaffold/custom_appbar.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({super.key, this.showAppbar = true, required this.body});
  bool showAppbar;
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: showAppbar ? true : false,
      backgroundColor: Colors.transparent,
    //  appBar: showAppbar ? CustomAppbar.appBar(context) : null,
      extendBody: true,
      body: body,
      drawer: AppDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: !showAppbar
          ? null
          : AppTextButtonsWithIcon(
            icon: Icons.add_box_rounded,
              autoPlayAnimation: true,
              width: 230.w,
              text: AppLocaleKeys.addNewList.tr,
              onPressed: () {},
            ),
    );
  }
}
