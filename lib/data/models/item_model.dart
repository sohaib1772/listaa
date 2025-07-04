class ItemModel {
  final int? id;
  final String name;
  final double price;
  final bool isDone;
  final int listId;

  ItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.isDone,
    required this.listId,
  });

  Map<String, dynamic> toMap() {
    return {
      'item_id': id,
      'name': name,
      'price': price,
      'is_done': isDone,
      'list_id': listId,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['item_id'],
      name: map['name'] ?? "",
      price: map['price'] ?? 0,
      isDone: map['is_done'] == 1 ? true : false,
      listId: map['list_id'],
    );
  }
}
