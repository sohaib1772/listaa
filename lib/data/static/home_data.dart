import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

enum Priority { high, medium, normal }

abstract class HomeData {
  /// Retrieves all home shopping lists from the database.
  ///
  /// Executes a SQL query to fetch all home lists and processes the joined data
  /// into a list of [ShoppingListModel] objects, including their associated items.
  ///
  /// Returns a [Future] containing a list of [ShoppingListModel] representing
  /// the home shopping lists.
  Future<List<ShoppingListModel>> getAllHomeLists();

  /// Retrieves home shopping lists filtered by the specified priority.
  ///
  /// [priority] - The priority level to filter by (high, medium, normal)
  ///
  /// Returns a [Future] containing a list of [ShoppingListModel] objects
  /// that match the specified priority, including their associated items.
  Future<List<ShoppingListModel>> getHomeListsByPriority(Priority priority);
}

class HomeDataImpl extends DbHelper implements HomeData {
  @override
  Future<List<ShoppingListModel>> getAllHomeLists() async {
    final dataList = await inquiry(SqlQueries.getAllHomeLists);
    
    return _processJoinedListData(dataList);
  }

  @override
  Future<List<ShoppingListModel>> getHomeListsByPriority(
    Priority priority,
  ) async {
    // Convert enum to priority value (you can adjust these values as needed)
    final priorityValue = switch (priority) {
      Priority.high => 2,
      Priority.medium => 1,
      Priority.normal => 0,
    };

    final dataList = await inquiry(
      SqlQueries.getHomeListsByPriority,
      arguments: [priorityValue],
    );

    return _processJoinedListData(dataList);
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
