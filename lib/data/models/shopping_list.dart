class ShoppingList {
  final int? id;
  final String title;
  final DateTime date;
  final double totalAmount;
  final int priority;
  final bool isDeleted;

  ShoppingList({
    this.id,
    required this.title,
    required this.date,
    required this.totalAmount,
    required this.priority,
    required this.isDeleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'total_amount': totalAmount,
      'priority': priority,
      'is_deleted': isDeleted ? 1 : 0,
    };
  }

  factory ShoppingList.fromMap(Map<String, dynamic> map) {
    return ShoppingList(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      totalAmount: map['total_amount'],
      priority: map['priority'],
      isDeleted: map['is_deleted'] == 1,
    );
  }
}
