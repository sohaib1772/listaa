import 'package:listaa/data/models/item_model.dart';

class ShoppingListModel {
  final int? id;
  final String title;
  final DateTime date;
  final DateTime? time;
  final double totalPrice;
  final int priority;
  bool isDeleted;
  bool isCollapsed;
  bool isTemplate;
  final int categoryId;
  List<ItemModel> items;

  ShoppingListModel({
    this.id,
    required this.title,
    required this.date,
    this.time,
    this.totalPrice = 0.0,
    this.priority = 0,
    this.isDeleted = false,
    this.isCollapsed = false,
    this.isTemplate = false,
    required this.categoryId,
    List<ItemModel>? items,
  }) : items = items ?? [];

  Map<String, dynamic> toMap() {
    return {
      'list_id': id,
      'title': title,
      'date': date.toIso8601String(),
      'time': time!.toIso8601String(),
      'total_price': totalPrice,
      'priority': priority,
      'is_deleted': isDeleted ? 1 : 0,
      'items': items.map((item) => item.toMap()).toList(),
      'is_collapsed': isCollapsed ? 1 : 0,
      'is_template': isTemplate ? 1 : 0,
      'category_id': categoryId,
    };
  }

  factory ShoppingListModel.fromJoinedMap(Map<String, dynamic> map) {
    return ShoppingListModel(
      id: map['list_id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      time: DateTime.tryParse(map['time'] ?? "") ?? DateTime.now(),
      totalPrice: map['total_price']?.toDouble() ?? 0.0,
      priority: map['priority'],
      isDeleted: map['is_deleted'] == 1,
      isCollapsed: map['is_collapsed'] == 1,
      isTemplate: map['is_template'] == 1,
      categoryId: map['category_id'],
      items: map['items'] != null
          ? List<ItemModel>.from(
              map['items'].map((item) => ItemModel.fromMapQR(item)),
            )
          : [],
    );
  }

  void addItem(ItemModel item) {
    items.add(item);
  }
}
