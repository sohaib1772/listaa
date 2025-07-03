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
import 'package:listaa/view/home/widgets/home_add_list_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({
    super.key,
    this.showAppbar = true,
    required this.body,
    this.showAddListButton = false,
    required this.scaffoldKey,
    this.appBarTitle,
    this.floatingActionButton,
  });
  bool showAppbar;
  Widget body;
  bool showAddListButton;
  GlobalKey<ScaffoldState> scaffoldKey;
  String? appBarTitle;
  Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: showAppbar ? false : true,
      backgroundColor: Colors.transparent,
      appBar: showAppbar
          ? CustomAppbar.appBar(context, title: appBarTitle)
          : null,
      extendBody: true,
      body: body,
      drawer: AppDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: floatingActionButton ??(!showAddListButton
          ? null
          : AppIconButton(
              icon: Icons.add_box_rounded,
              autoPlayAnimation: true,
              onPressed: () {
                Get.bottomSheet(HomeAddListBottomSheet());
              },
            )),
    );
  }
}
