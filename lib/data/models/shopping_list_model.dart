import 'package:listaa/data/models/item_model.dart';

class ShoppingListModel {
  final int? id;
  final String title;
  final DateTime date;
  final double totalAmount;
  final int priority;
  final bool isDeleted;
   bool isCollapsed;
   List<ItemModel> items;

  ShoppingListModel({
    this.id,
    required this.title,
    required this.date,
    required this.totalAmount,
    required this.priority,
    required this.isDeleted,
    required this.items,
    required this.isCollapsed,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'total_amount': totalAmount,
      'priority': priority,
      'is_deleted': isDeleted ? 1 : 0,
      'items': items.map((item) => item.toMap()).toList(),
      'is_collapsed': isCollapsed ? 1 : 0,
    };
  }

  factory ShoppingListModel.fromMap(Map<String, dynamic> map) {
    return ShoppingListModel(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      totalAmount: map['total_amount'],
      priority: map['priority'],
      isDeleted: map['is_deleted'] == 1,
      items: List<ItemModel>.from(map['items'].map((item) => ItemModel.fromMap(item))),
      isCollapsed: map['is_collapsed'] == 1,
    );
  }
}
