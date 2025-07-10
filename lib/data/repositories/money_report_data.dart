import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/money_report_model.dart';

abstract class MoneyReportData {
  Future<List<MoneyReportModel>> getSpendingInGeneral();
  Future<List<MoneyReportModel>> getSpendingByWeek();
  Future<List<MoneyReportModel>> getSpendingByCurrentMonth();
  Future<List<MoneyReportModel>> getSpendingByLastMonth();
  Future<List<MoneyReportModel>> getSpendingByCurrentYear();
  Future<List<MoneyReportModel>> getSpendingByCurrentDay();
}

class MoneyReportDataImpl extends DbHelper implements MoneyReportData {
  @override
  Future<List<MoneyReportModel>> getSpendingInGeneral() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingInGeneral);
    for (var raw in rawList) {
      print("total spent = ${raw['total_spent']}");
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<MoneyReportModel>> getSpendingByWeek() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingByWeek);
    for (var raw in rawList) {
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<MoneyReportModel>> getSpendingByCurrentMonth() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingCurrentMonth);
    for (var raw in rawList) {
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<MoneyReportModel>> getSpendingByLastMonth() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingPreviousMonth);
    for (var raw in rawList) {
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<MoneyReportModel>> getSpendingByCurrentYear() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingCurrentYear);
    for (var raw in rawList) {
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }

  @override
  Future<List<MoneyReportModel>> getSpendingByCurrentDay() async {
    List<MoneyReportModel> dataList = [];
    final rawList = await inquiry(SqlQueries.spendingToday);
    for (var raw in rawList) {
      dataList.add(MoneyReportModel.fromMap(raw));
    }
    return dataList;
  }
}
