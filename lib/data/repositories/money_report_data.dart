import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/money_report_model.dart';

abstract class MoneyReportData {
  Future<List<SpendingReportModel>> getDailyReports();
  Future<List<SpendingReportModel>> getWeeklyReports();
  Future<List<SpendingReportModel>> getMonthlyReports();
  Future<List<SpendingReportModel>> getYearlyReports();
  Future<List<CategoryReportModel>> getCategoryReports();
}

class MoneyReportDataImpl extends DbHelper implements MoneyReportData {
  @override
  Future<List<SpendingReportModel>> getDailyReports() async {
    final rawList = await inquiry(SqlQueries.dailySpendingReport);
    List<SpendingReportModel> dataList = [];
    for (var raw in rawList) {
      dataList.add(SpendingReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<SpendingReportModel>> getWeeklyReports() async {
    final rawList = await inquiry(SqlQueries.weeklySpendingReport);
    List<SpendingReportModel> dataList = [];
    for (var raw in rawList) {
      dataList.add(SpendingReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<SpendingReportModel>> getMonthlyReports() async {
    final rawList = await inquiry(SqlQueries.monthlySpendingReport);
    List<SpendingReportModel> dataList = [];
    for (var raw in rawList) {
      dataList.add(SpendingReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<SpendingReportModel>> getYearlyReports() async {
    final rawList = await inquiry(SqlQueries.yearlySpendingReport);
    List<SpendingReportModel> dataList = [];
    for (var raw in rawList) {
      dataList.add(SpendingReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<CategoryReportModel>> getCategoryReports() async {
    final rawList = await inquiry(SqlQueries.spendingByCategory);
    List<CategoryReportModel> dataList = [];
    for (var raw in rawList) {
      dataList.add(CategoryReportModel.fromMap(raw));
    }
    return dataList;
  }
}
