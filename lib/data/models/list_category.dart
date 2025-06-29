class ListCategory {
  final int? id;
  final int listId;
  final int categoryId;

  ListCategory({this.id, required this.listId, required this.categoryId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'list_id': listId,
      'category_id': categoryId,
    };
  }

  factory ListCategory.fromMap(Map<String, dynamic> map) {
    return ListCategory(
      id: map['id'],
      listId: map['list_id'],
      categoryId: map['category_id'],
    );
  }
}