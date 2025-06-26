import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/core/widgets/scaffold/custom_appbar.dart';

class CustomScaffold extends StatelessWidget {
   CustomScaffold({super.key,this.showAppbar = true,required this.body});
  bool showAppbar;
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: showAppbar ? true : false,
      backgroundColor: Colors.transparent,
      appBar: showAppbar ?CustomAppbar.appBar() : null,
      
      body: body,
      
      drawer: Drawer(
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: !showAppbar ? null : AppTextButtonsWithIcon(
        width: 254,
        text: AppLocaleKeys.addNewList.tr, onPressed: (){}),
    );
  }
}