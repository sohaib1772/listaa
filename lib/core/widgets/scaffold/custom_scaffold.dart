import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:get/state_manager.dart';

import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/drawer/app_drawer.dart';
import 'package:listaa/core/widgets/scaffold/custom_appbar.dart';
import 'package:listaa/view/home/widgets/home_add_list_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomScaffold extends StatelessWidget {
 const CustomScaffold({
    super.key,
    this.showAppbar = true,
    required this.body,
    this.showAddListButton = false,
    required this.scaffoldKey,
    this.appBarTitle,
    this.floatingActionButton,
    this.appBarAction,
  });
 final bool showAppbar;
 final Widget body;
 final bool showAddListButton;
 final GlobalKey<ScaffoldState> scaffoldKey;
 final String? appBarTitle;
 final Widget? floatingActionButton;
 final Widget? appBarAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: showAppbar ? false : true,
      backgroundColor: Colors.transparent,
      appBar: showAppbar
          ? CustomAppbar.appBar(context, title: appBarTitle, actions: [appBarAction ?? SizedBox.shrink()])
          : null,
      extendBody: true,
      body: body,
      drawer: AppDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: floatingActionButton ??(!showAddListButton
          ? null
          : AppIconButton(
            
              icon: Icons.add,
              autoPlayAnimation: true,
              onPressed: () {
                Get.bottomSheet(HomeAddListBottomSheet());
              },
            )),
    );
  }
}
