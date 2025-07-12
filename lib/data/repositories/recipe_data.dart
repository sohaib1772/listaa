import 'package:flutter/cupertino.dart';
import 'package:listaa/core/constants/app_default_data.dart';
import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class RecipeData {
  Future<void> insertDefaultRecipes();
  Future<List<ShoppingListModel>> getRecipes();
}

class RecipeDataImpl extends DbHelper implements RecipeData {
  /// Inserts the default recipes and their associated items into the database.
  ///
  /// This method performs a database transaction to insert each recipe from
  /// [AppDefaultData.defaultRecipes] into the 'lists' table, ignoring conflicts.
  /// After inserting the recipes, it calls [_insertRecipeItems] to insert the
  /// related recipe items.
  ///
  /// If a [DatabaseException] occurs during the transaction, it is caught and
  /// logged using [debugPrint].
  @override
  Future<void> insertDefaultRecipes() async {
    Database? db = await getInstance;
    try {
      await db!.transaction((txn) async {
        for (var recipe in AppDefaultData.defaultRecipes) {
          await txn.insert(
            'lists',
            recipe,
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
      });
      await _insertRecipeItems();
    } on DatabaseException catch (e) {
      debugPrint('failed to insert default recipes : $e');
    }
  }

  Future<void> _insertRecipeItems() async {
    final parametersList = AppDefaultData.defaultItems
        .map((item) => [item['item_id'], item['name'], item['list_id']])
        .toList();
    await insertBatch(SqlQueries.createRecipeItem, parametersList);
  }

  /// Retrieves all recipes along with their associated items from the database.
  ///
  /// Executes the SQL query defined in [SqlQueries.getRecipes] to fetch the
  /// joined data of recipes and their items. The raw query result is then
  /// processed by [_processJoinedListData] to convert it into a list of
  /// [ShoppingListModel] objects, each containing their respective items.
  ///
  /// Returns a [Future] that completes with a list of [ShoppingListModel].

  @override
  Future<List<ShoppingListModel>> getRecipes() async {
    final dataList = await inquiry(SqlQueries.getRecipes);

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
