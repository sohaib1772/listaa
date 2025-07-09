import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

enum Priority { high, medium, normal }

abstract class ListData {
  Future<List<ShoppingListModel>> getAllLists();

  Future<List<ShoppingListModel>> getListsByPriority(Priority priority);

  Future<int> markItemAsDone(int itemId, bool isDone);

  Future<int> createNewList(ShoppingListModel shoppingList);

  Future<int> softDeleteList(int listId);

  Future<int> editList(ShoppingListModel shoppingList);
}

class ListDataImpl extends DbHelper implements ListData {
  /// Retrieves all shopping lists from the database.
  ///
  /// Executes a SQL query to fetch all home lists and processes the joined data
  /// into a list of [ShoppingListModel] objects, including their associated items.
  ///
  /// Returns a [Future] containing a list of [ShoppingListModel] representing
  /// the home shopping lists.
  @override
  Future<List<ShoppingListModel>> getAllLists() async {
    final dataList = await inquiry(SqlQueries.getAllLists);

    return _processJoinedListData(dataList);
  }

  /// Retrieves shopping lists filtered by the specified priority.
  ///
  /// [priority] - The priority level to filter by (high, medium, normal)
  ///
  /// Returns a [Future] containing a list of [ShoppingListModel] objects
  /// that match the specified priority, including their associated items.
  @override
  Future<List<ShoppingListModel>> getListsByPriority(Priority priority) async {
    // Convert enum to priority value (you can adjust these values as needed)
    final priorityValue = switch (priority) {
      Priority.high => 2,
      Priority.medium => 1,
      Priority.normal => 0,
    };

    final dataList = await inquiry(
      SqlQueries.getListsByPriority,
      arguments: [priorityValue],
    );

    return _processJoinedListData(dataList);
  }

  /// Marks an item as done or not done in the database.
  ///
  /// Updates the 'is_done' status of a specific item identified by [itemId].
  ///
  /// [itemId] The unique identifier of the item to update.
  /// [isDone] A boolean indicating whether the item should be marked as done (true) or not done (false).
  ///
  /// Returns the number of rows affected by the update operation.
  @override
  Future<int> markItemAsDone(int itemId, bool isDone) async {
    List<dynamic> arguments = [isDone ? 1 : 0, itemId];
    int affectedRows = await update(SqlQueries.changeItemIsDone, arguments);
    return affectedRows;
  }

  /// Creates a new shopping list in the database.
  ///
  /// [shoppingList] - The ShoppingListModel to be created
  ///
  /// Returns a [Future] that completes when the list is created.
  @override
  Future<int> createNewList(ShoppingListModel shoppingList) async {
    // Prepare arguments list
    final List<dynamic> arguments = [
      shoppingList.title,
      shoppingList.date.toIso8601String(),
      shoppingList.time?.toIso8601String(),
      shoppingList.totalPrice,
      shoppingList.priority,
      shoppingList.isDeleted ? 1 : 0,
      shoppingList.isCollapsed ? 1 : 0,
      shoppingList.categoryId,
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

  /// Soft deletes a shopping list by its ID.
  ///
  /// Marks the list as deleted in the database without permanently removing it.
  ///
  /// [listId] The unique identifier of the list to be soft deleted.
  ///
  /// Returns the number of affected rows in the database after the soft delete operation.
  /// If 0 rows are affected, the deletion was not successful.
  @override
  Future<int> softDeleteList(int listId) async {
    // Execute the soft delete update
    final affectedRows = await update(SqlQueries.softDeleteList, [listId]);

    return affectedRows; // Returns number of rows affected (should be 1 if list exists)
  }

  /// Updates an existing shopping list and its items in the database.
  ///
  /// [shoppingList] - The ShoppingListModel with updated values
  ///
  /// Returns a [Future] that completes when the list and items are updated.
  /// Returns the number of affected rows for the list update.
  @override
  Future<int> editList(ShoppingListModel shoppingList) async {
    if (shoppingList.id == null) {
      throw ArgumentError('Cannot edit list without an ID');
    }

    // Prepare arguments list
    final List<dynamic> arguments = [
      shoppingList.title,
      shoppingList.date.toIso8601String(),
      shoppingList.time?.toIso8601String(),
      shoppingList.totalPrice,
      shoppingList.priority,
      shoppingList.isDeleted ? 1 : 0,
      shoppingList.isCollapsed ? 1 : 0,
      shoppingList.categoryId,
      shoppingList.id,
    ];

    // Update the list
    final affectedRows = await update(SqlQueries.updateList, arguments);

    // Update items - delete existing and insert new ones
    await _updateListItems(shoppingList.id!, shoppingList.items);

    return affectedRows;
  }

  Future<void> _updateListItems(int listId, List<ItemModel> items) async {
    // First delete all existing items
    await delete(SqlQueries.deleteListItems, [listId]);

    // Then insert the updated items
    if (items.isNotEmpty) {
      await _insertListItems(listId, items);
    }
  }

  List<ShoppingListModel> _processJoinedListData(
    List<Map<String, dynamic>> rows,
  ) {
    final listsMap = <int, ShoppingListModel>{};

    for (final row in rows) {
      final listId = row['list_id'] as int?;
      if (listId == null) continue;

      // Get or create the shopping list
      final list = listsMap.putIfAbsent(
        listId,
        () => ShoppingListModel.fromJoinedMap(row),
      );

      // Add item if exists
      if (row['item_id'] != null) {
        list.addItem(ItemModel.fromMap(row));
      }
    }
    return listsMap.values.toList();
  }
}
