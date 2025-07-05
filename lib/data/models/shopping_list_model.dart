import 'package:listaa/data/models/item_model.dart';

class ShoppingListModel {
  final int? id;
  final String title;
  final DateTime date;
  final double totalPrice;
  final int priority;
  final bool isDeleted;
  bool isCollapsed;
  List<ItemModel> items;

  ShoppingListModel({
    this.id,
    required this.title,
    required this.date,
    required this.totalPrice,
    required this.priority,
    required this.isDeleted,
    this.isCollapsed = false,
    List<ItemModel>? items,
  }): items = items ?? [];

  Map<String, dynamic> toMap() {
    return {
      'list_id': id,
      'title': title,
      'date': date.toIso8601String(),
      'total_price': totalPrice,
      'priority': priority,
      'is_deleted': isDeleted ? 1 : 0,
      'items': items.map((item) => item.toMap()).toList(),
      'is_collapsed': isCollapsed ? 1 : 0,
    };
  }

  factory ShoppingListModel.fromJoinedMap(Map<String, dynamic> map) {
    return ShoppingListModel(
      id: map['list_id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      totalPrice: map['total_price']?.toDouble() ?? 0.0,
      priority: map['priority'],
      isDeleted: map['is_deleted'] == 1,
      isCollapsed: map['is_collapsed'] == 1,
    );
  }

  void addItem(ItemModel item) {
    items.add(item);
  }
}
