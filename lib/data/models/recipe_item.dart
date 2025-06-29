class RecipeItem {
  final int? id;
  final int recipeId;
  final int itemId;

  RecipeItem({this.id, required this.recipeId, required this.itemId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'recipe_id': recipeId, 'item_id': itemId};
  }

  factory RecipeItem.fromMap(Map<String, dynamic> map) {
    return RecipeItem(
      id: map['id'],
      recipeId: map['recipe_id'],
      itemId: map['item_id'],
    );
  }
}
