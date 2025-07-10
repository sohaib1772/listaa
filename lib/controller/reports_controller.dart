import 'dart:math';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/data/models/money_report_model.dart';
import 'package:listaa/data/repositories/money_report_data.dart';
enum ReportType { today, currentWeek, currentMonth,lastMonth, currentYear,all }
class ReportsController extends GetxController {
  final MoneyReportData moneyReportData = Get.find<MoneyReportDataImpl>();

  String selectedReportType = AppLocaleKeys.all.tr;
  // بيانات الأصناف
  RxList<MoneyReportModel> categoryReports = <MoneyReportModel>[].obs;
  
  RxDouble totalSpent = 0.0.obs;

  // ألوان الأصناف
  final Map<String, Color> _categoryColorMap = {};
  final List<Color> _presetColors = [
    Color(0xFFFFC288),
    Color(0xFF87CEFA),
    Color(0xFFFF9AA2),
    Color(0xFFB5EAD7),
    Color(0xFFFDCB9E),
    Color(0xFFBFD3C1),
    Color(0xFFF1F0C0),
    Color(0xFFECB3FF),
  ];

  Color getCategoryColor(String categoryName) {
    if (_categoryColorMap.containsKey(categoryName)) {
      return _categoryColorMap[categoryName]!;
    }

    for (final color in _presetColors) {
      if (!_categoryColorMap.containsValue(color)) {
        _categoryColorMap[categoryName] = color;
        return color;
      }
    }

    final h = Random().nextDouble() * 360;
    final pastel = HSLColor.fromAHSL(1.0, h, 0.5, 0.85).toColor();
    _categoryColorMap[categoryName] = pastel;
    return pastel;
  }

  List<PieChartSectionData> get pieSections {
    return categoryReports.map((category) {
      final percent = ((category.totalSpent / totalSpent.value) * 100).toStringAsFixed(0);
      return PieChartSectionData(
        color: getCategoryColor(category.category),
        value: category.totalSpent,
        title: '$percent%',
        radius: 30,
        titleStyle: AppTextStyles.darkbold16,
      );
    }).toList();
  }
  
  // دوال تحميل التقارير حسب النوع
  Future<void> loadReportsByDate({required ReportType type}) async {
    switch (type) {
      case ReportType.today:
        categoryReports.value = await moneyReportData.getSpendingByCurrentDay();
        selectedReportType = AppLocaleKeys.today.tr;
        break;
      case ReportType.currentWeek:
        categoryReports.value = await moneyReportData.getSpendingByWeek();
        selectedReportType = AppLocaleKeys.currentWeek.tr;
        break;
      case  ReportType.currentMonth:
        categoryReports.value = await moneyReportData.getSpendingByCurrentMonth();
        selectedReportType = AppLocaleKeys.currentMonth.tr;
        break;
      case  ReportType.lastMonth:
        categoryReports.value = await moneyReportData.getSpendingByLastMonth();
        selectedReportType = AppLocaleKeys.lastMonth.tr;
        break;
      case  ReportType.currentYear:
        categoryReports.value = await moneyReportData.getSpendingByCurrentYear();
        selectedReportType = AppLocaleKeys.currentYear.tr;
        break;
      default:
        categoryReports.value = await moneyReportData.getSpendingInGeneral();
        selectedReportType = AppLocaleKeys.all.tr;
        break;
    }
    sumTotalSpent();
    update();
  }

  Future<void> loadCategoryReports() async {
    categoryReports.value = await moneyReportData.getSpendingInGeneral();
    sumTotalSpent();
  }

  void sumTotalSpent(){
   totalSpent.value =  categoryReports.fold(0.0, 
    (previousValue, element) => (previousValue + element.totalSpent).toDouble(),
    );
  }

  // تحميل الكل دفعة واحدة
  Future<void> loadAll(String type) async {
    await loadCategoryReports();
  }
}