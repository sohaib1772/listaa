

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum AppIconsName {
  trash,
  settings,
  doneList,
  clock,
  gridView,
  chart,
  hamburgerMenu,
  dollar,
  redFlag,
  blueFlag,
  grayFlag,
  notifications,
  arrowDown,
  add,
  event,
  fruits,
  collage,
  cinema,
  milk,
  chicken,
  drink,
  cake,
  all,
  close
}class AppIcons extends StatelessWidget {
  final AppIconsName icon;
 final double size;
 final Color? color;
  AppIcons({required this.icon,this.size = 24,this.color});
  static const String _mainPath = "assets/svgs/icons";
  static  Map<AppIconsName, String> get _iconPaths => {
    AppIconsName.trash: '$_mainPath/trash.svg',
    AppIconsName.settings: '$_mainPath/settings.svg',
    AppIconsName.doneList: '$_mainPath/done_list.svg',
    AppIconsName.clock: '$_mainPath/clock.svg',
    AppIconsName.gridView: '$_mainPath/grid_view.svg',
    AppIconsName.chart: '$_mainPath/chart.svg',
    AppIconsName.hamburgerMenu: '$_mainPath/hamburger_menu.svg',
    AppIconsName.dollar: '$_mainPath/dollar.svg',
    AppIconsName.redFlag: '$_mainPath/red_flag.svg',
    AppIconsName.blueFlag: '$_mainPath/blue_flag.svg',
    AppIconsName.grayFlag: '$_mainPath/gray_flag.svg',
    AppIconsName.notifications: '$_mainPath/notifications.svg',
    AppIconsName.arrowDown: '$_mainPath/arrow_down.svg',
    AppIconsName.add: '$_mainPath/add.svg',
    AppIconsName.event: '$_mainPath/event.svg',
    AppIconsName.fruits: '$_mainPath/fruits.svg',
    AppIconsName.collage: '$_mainPath/collage.svg',
    AppIconsName.cinema: '$_mainPath/cinema.svg',
    AppIconsName.milk: '$_mainPath/milk.svg',
    AppIconsName.chicken: '$_mainPath/chicken.svg', 
    AppIconsName.drink: '$_mainPath/drink.svg',
    AppIconsName.cake: '$_mainPath/cake.svg',
    AppIconsName.all: '$_mainPath/all.svg',
    AppIconsName.close: '$_mainPath/close.svg',

  };
  bool matchTextDirection(){
    switch(icon){
      case AppIconsName.dollar:return false;
      case AppIconsName.redFlag:return false;
      case AppIconsName.blueFlag:return false;
      case AppIconsName.grayFlag:return false;
      case AppIconsName.all:return false;
      case AppIconsName.add:return false;
      case AppIconsName.trash:return false;
      case AppIconsName.clock:return false;
      case AppIconsName.doneList:return false;
      case AppIconsName.settings:return false;

      default:return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    if (_iconPaths[icon] == null) {
      return const SizedBox(); 
    }
    return SvgPicture.asset(_iconPaths[icon]!, height: size.h, width: size.w,colorFilter: ColorFilter.mode(color ?? Colors.transparent, BlendMode.srcATop),matchTextDirection: matchTextDirection(),);
  }
}