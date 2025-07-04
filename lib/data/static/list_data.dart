import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

abstract class ListData {
  /// Creates a new shopping list in the database.
  ///
  /// [shoppingList] - The ShoppingListModel to be created
  ///
  /// Returns a [Future] that completes when the list is created.
  Future<int> createNewList(ShoppingListModel shoppingList);
}

class ListDataImpl extends DbHelper implements ListData {
  @override
  Future<int> createNewList(ShoppingListModel shoppingList) async {
    // Prepare arguments list
    final List<dynamic> arguments = [
      shoppingList.title,
      shoppingList.date.toIso8601String(), // Convert DateTime to string
      shoppingList.totalPrice,
      shoppingList.priority,
      shoppingList.isDeleted ? 1 : 0,
      shoppingList.isCollapsed ? 1 : 0,
    ];

    // Execute the insert
    final int listId = await insert(SqlQueries.createNewList, arguments);

    // If the list has items, insert them too
    if (shoppingList.items.isNotEmpty) {
      await _insertListItems(listId, shoppingList.items);
    }

    return listId;
  }

  Future<void> _insertListItems(int listId, List<ItemModel> items) async {
    final parametersList = items
        .map((item) => [item.name, item.price, item.isDone ? 1 : 0, listId])
        .toList();

    await insertBatch(SqlQueries.createNewItem, parametersList);
  }
}
