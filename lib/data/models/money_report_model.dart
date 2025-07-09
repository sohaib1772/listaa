class MoneyReportModel {
  final String category;
  final double totalSpent;
  final int listsCount;

  MoneyReportModel({
    required this.category,
    required this.totalSpent,
    required this.listsCount,
  });

  factory MoneyReportModel.fromMap(Map<String, dynamic> map) {
    return MoneyReportModel(
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
