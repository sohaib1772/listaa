class ListItem {
  final int? id;
  final double buyPrice;
  final int itemId;
  final int listId;
  final DateTime buyDate;
  final bool isDone;

  ListItem({
    this.id,
    required this.buyPrice,
    required this.itemId,
    required this.listId,
    required this.buyDate,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'buy_price': buyPrice,
      'item_id': itemId,
      'list_id': listId,
      'buy_date': buyDate.toIso8601String(),
      'is_done': isDone ? 1 : 0,
    };
  }

  factory ListItem.fromMap(Map<String, dynamic> map) {
    return ListItem(
      id: map['id'],
      buyPrice: map['buy_price'],
      itemId: map['item_id'],
      listId: map['list_id'],
      buyDate: DateTime.parse(map['buy_date']),
      isDone: map['is_done'] == 1,
    );
  }
}
