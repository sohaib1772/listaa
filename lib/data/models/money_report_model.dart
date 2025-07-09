class SpendingReportModel {
  final String period;
  final double totalSpent;
  final int listsCount;
  final int? itemsCount; // Only for daily reports

  SpendingReportModel({
    required this.period,
    required this.totalSpent,
    required this.listsCount,
    this.itemsCount,
  });

  factory SpendingReportModel.fromMap(Map<String, dynamic> map) {
    return SpendingReportModel(
      period: map['period'] as String,
      totalSpent: (map['total_spent'] as num).toDouble(),
      listsCount: map['lists_count'] as int,
      itemsCount: map['items_count'] != null ? map['items_count'] as int : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'period': period,
      'total_spent': totalSpent,
      'lists_count': listsCount,
      if (itemsCount != null) 'items_count': itemsCount,
    };
  }
}

class CategoryReportModel {
  final String category;
  final double totalSpent;
  final int listsCount;

  CategoryReportModel({
    required this.category,
    required this.totalSpent,
    required this.listsCount,
  });

  factory CategoryReportModel.fromMap(Map<String, dynamic> map) {
    return CategoryReportModel(
      category: map['category'] as String,
      totalSpent: (map['total_spent'] as num).toDouble(),
      listsCount: map['lists_count'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'total_spent': totalSpent,
      'lists_count': listsCount,
    };
  }
}
