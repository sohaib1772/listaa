import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/grouped_shopping_lists_model.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

abstract class TrashData {
  /// Retrieves a list of soft-deleted shopping lists with their associated items.
  ///
  /// Queries the database for soft-deleted lists and processes them into a grouped
  /// list of shopping lists, sorted from newest to oldest.
  ///
  /// Returns a [Future] containing a list of [GroupedShoppingListsModel] representing
  /// the soft-deleted shopping lists grouped by date.
  Future<List<GroupedShoppingListsModel>> getSoftDeletedList();

  /// Deletes a shopping list and its associated items from the database.
  ///
  /// [listId] - The unique identifier of the shopping list to be deleted
  ///
  /// Removes all items linked to the specified list and then deletes the list itself.
  /// This is a hard delete operation that permanently removes the list and its items.
  Future<void> deleteList(int listId);

  /// Restores a previously soft-deleted list by its [listId].
  ///
  /// Updates the list's deleted status in the database, marking it as not deleted.
  ///
  /// Returns the number of rows affected by the restore operation.
  ///
  /// [listId] The unique identifier of the list to be restored.
  Future<int> restoreDeletedList(int listId);
}

class TrashDataImpl extends DbHelper implements TrashData {
  @override
  Future<List<GroupedShoppingListsModel>> getSoftDeletedList() async {
    final dataList = await inquiry(SqlQueries.getSoftDeletedListsWithItems);
    return _processGroupedSoftDeletedLists(dataList);
  }

  List<GroupedShoppingListsModel> _processGroupedSoftDeletedLists(
    List<Map<String, dynamic>> rows,
  ) {
    final dateMap = <String, GroupedShoppingListsModel>{};

    for (final row in rows) {
      final date = DateTime.parse(row['date'].toString());
      final dateKey = '${date.year}-${date.month}-${date.day}';

      // Get or create the date group
      final group = dateMap.putIfAbsent(
        dateKey,
        () => GroupedShoppingListsModel.fromJoinedMap(row),
      );

      // Create and add the shopping list if not already present
      if (!_containsList(group.shoppingLists, row['list_id'])) {
        group.addShoppingList(ShoppingListModel.fromJoinedMap(row));
      }

      // Add item if exists
      if (row['item_id'] != null) {
        final currentList = group.shoppingLists.firstWhere(
          (list) => list.id == row['list_id'],
        );
        currentList.addItem(ItemModel.fromMap(row));
      }
    }

    return dateMap.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date)); // Newest first
  }

  bool _containsList(List<ShoppingListModel> lists, int listId) {
    return lists.any((list) => list.id == listId);
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
  Future<int> restoreDeletedList(int listId) async {
    return await update(SqlQueries.restoreList, [listId]);
  }
}
