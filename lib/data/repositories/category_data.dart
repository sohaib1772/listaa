import 'package:flutter/material.dart';
import 'package:listaa/core/constants/app_default_data.dart';
import 'package:listaa/core/constants/sql_queries.dart';
import 'package:listaa/core/helper/db_helper.dart';
import 'package:listaa/data/models/category_model.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class CategoryData {
  Future<void> insertDefaultCategories();

  Future<int> createNewCategory(CategoryModel category);

  Future<List<CategoryModel>> getCategories();

  Future<bool> deleteCategory(int categoryId);
}

class CategoryDataImpl extends DbHelper implements CategoryData {
  /// Inserts default categories into the database if they do not already exist.
  ///
  /// This method uses a database transaction to insert predefined categories
  /// from [AppDefaultData.defaultCategories] into the 'categories' table.
  /// If a category already exists, it will be ignored due to the
  /// [ConflictAlgorithm.ignore] conflict resolution strategy.
  ///
  /// Throws a [DatabaseException] if there is an error during the database operation.
  @override
  Future<void> insertDefaultCategories() async {
    Database? db = await getInstance;
    try {
      await db!.transaction((txn) async {
        for (var category in AppDefaultData.defaultCategories) {
          await txn.insert(
            'categories',
            category,
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
      });
    } on DatabaseException catch (e) {
      debugPrint('failed to insert default category : $e');
    }
  }

  /// Creates a new category in the database.
  ///
  /// Takes a [CategoryModel] and inserts it into the database using a predefined SQL query.
  ///
  /// [category] The category model to be inserted.
  ///
  /// Returns the ID of the newly created category.
  ///
  /// Throws a [DatabaseException] if there is an error during the database insertion.
  @override
  Future<int> createNewCategory(CategoryModel category) async {
    final List<dynamic> arguments = [category.title, category.isDefault];
    final int categoryId = await insert(
      SqlQueries.createNewCategory,
      arguments,
    );

    return categoryId;
  }

  /// Retrieves all categories from the database.
  ///
  /// Fetches category data using a predefined SQL query, converts each database row
  /// into a [CategoryModel], and returns a list of these category models.
  ///
  /// Returns a [Future] list of [CategoryModel] containing all stored categories.
  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    final dataList = await inquiry(SqlQueries.getCategories);
    for (final row in dataList) {
      categories.add(CategoryModel.fromMap(row));
    }
    return categories;
  }

  /// Delete category from the database.
  @override
  Future<bool> deleteCategory(int categoryId) async {
    final data = await inquiry(
      SqlQueries.getListsBelongsToCategory,
      arguments: [categoryId],
    );
    if (data.isNotEmpty) {
      //category could not be deleted because its associated with a list
      return false;
    } else {
      //category can be deleted
      await delete(SqlQueries.deleteCategory, [categoryId]);
      return true;
    }
  }
}
