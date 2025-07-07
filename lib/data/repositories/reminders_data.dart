import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/grouped_shopping_lists_model.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

abstract class RemindersData {
  /// Retrieves a list of reminders from the database and processes them into grouped shopping lists.
  ///
  /// This method performs a database query using [SqlQueries.getRemindersList] and transforms
  /// the raw query results into a structured list of [GroupedShoppingListsModel].
  ///
  /// Returns a sorted list of grouped shopping lists, ordered from most recent to oldest date.
  ///
  /// Throws an exception if there's an error during database querying or processing.
  Future<List<GroupedShoppingListsModel>> getRemindersList();
}

class RemindersDataImpl extends DbHelper implements RemindersData {
  @override
  Future<List<GroupedShoppingListsModel>> getRemindersList() async {
    final dataList = await inquiry(SqlQueries.getRemindersList);
    return _processGroupedRemindersList(dataList);
  }

  List<GroupedShoppingListsModel> _processGroupedRemindersList(
    List<Map<String, dynamic>> rows,
  ) {
    final dateMap = <String, GroupedShoppingListsModel>{};
    for (var row in rows) {
      final date = DateTime.parse(row['date'].toString());
      final dateKey = '${date.year}-${date.month}-${date.day}';

      final group = dateMap.putIfAbsent(
        dateKey,
        () => GroupedShoppingListsModel.fromJoinedMap(row),
      );
      if (!_containsList(group.shoppingLists, row['list_id'])) {
        group.addShoppingList(ShoppingListModel.fromJoinedMap(row));
      }
      if (row['item_id'] != null) {
        final currentList = group.shoppingLists.firstWhere(
          (list) => list.id == row['list_id'],
        );
        currentList.addItem(ItemModel.fromMap(row));
      }
    }
    return dateMap.values.toList()..sort((a, b) => b.date.compareTo(a.date));
  }

  bool _containsList(List<ShoppingListModel> lists, int listId) {
    return lists.any((list) => list.id == listId);
  }
}
