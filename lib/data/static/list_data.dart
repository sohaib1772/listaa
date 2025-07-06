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

  /// Deletes a shopping list and its associated items from the database.
  ///
  /// [listId] - The unique identifier of the shopping list to be deleted
  ///
  /// Removes all items linked to the specified list and then deletes the list itself.
  /// This is a hard delete operation that permanently removes the list and its items.
  Future<void> deleteList(int listId);

  /// Soft deletes a shopping list by its ID.
  ///
  /// Marks the list as deleted in the database without permanently removing it.
  ///
  /// [listId] The unique identifier of the list to be soft deleted.
  ///
  /// Returns the number of affected rows in the database after the soft delete operation.
  /// If 0 rows are affected, the deletion was not successful.
  Future<int> softDeleteList(int listId);

  /// Restores a previously soft-deleted list by its [listId].
  ///
  /// Updates the list's deleted status in the database, marking it as not deleted.
  ///
  /// Returns the number of rows affected by the restore operation.
  ///
  /// [listId] The unique identifier of the list to be restored.
  Future<int> restoreDeletedList(int listId);
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

  @override
  Future<void> deleteList(int listId) async {
    // First delete all items associated with the list
    await _deleteListItems(listId);

    // Then delete the list itself
    await delete(SqlQueries.deleteList, [listId]);
  }

  Future<void> _deleteListItems(int listId) async {
    await delete(SqlQueries.deleteListItems, [listId]);
  }

  @override
  Future<int> softDeleteList(int listId) async {
    // Execute the soft delete update
    final affectedRows = await update(SqlQueries.softDeleteList, [listId]);

    return affectedRows; // Returns number of rows affected (should be 1 if list exists)
  }

  @override
  Future<int> restoreDeletedList(int listId) async {
    return await update(SqlQueries.restoreList, [listId]);
  }
}
