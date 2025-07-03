import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

abstract class HomeData {
  Future<List<ShoppingListModel>> getAllHomeLists();
}

class HomeDataImpl extends DbHelper implements HomeData {
  @override
  /// Retrieves all home shopping lists from the database.
  ///
  /// Executes a SQL query to fetch all home lists and processes the joined data
  /// into a list of [ShoppingListModel] objects, including their associated items.
  ///
  /// Returns a [Future] containing a list of [ShoppingListModel] representing
  /// the home shopping lists.
  Future<List<ShoppingListModel>> getAllHomeLists() async {
    final dataList = await inquiry(SqlQueries.getAllHomeListsQuery);
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

  //Todo: get home lists by priority
}
