import 'package:listaa/data/models/shopping_list_model.dart';

class GroupedShoppingListsModel {
  final DateTime date;
  List<ShoppingListModel> shoppingLists;

  GroupedShoppingListsModel({
    required this.date,
    List<ShoppingListModel>? shoppingLists,
  }) : shoppingLists = shoppingLists ?? [];

  factory GroupedShoppingListsModel.fromJoinedMap(Map<String, dynamic> map) {
    return GroupedShoppingListsModel(date: DateTime.parse(map['date']));
  }

  void addShoppingList(ShoppingListModel shoppingList) {
    shoppingLists.add(shoppingList);
  }
}
