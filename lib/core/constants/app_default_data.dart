import 'package:listaa/core/localization/locale.dart';

class AppDefaultData {
  static final defaultCategories = [
    {
      'category_id': 0,
      'title': AppLocaleKeys.holyDaysAndEvents,
      'is_default': 1,
    },
    {
      'category_id': 1,
      'title': AppLocaleKeys.fruitsAndVegetable,
      'is_default': 1,
    },
    {'category_id': 2, 'title': AppLocaleKeys.marketAndOthers, 'is_default': 1},
    {'category_id': 3, 'title': AppLocaleKeys.public, 'is_default': 1},
  ];
  static final defaultRecipes = [
    {
      'list_id': 1,
      'title': 'test recipe 1',
      'is_template': 1,
      'category_id': 0,
    },
    {
      'list_id': 2,
      'title': 'test recipe 2',
      'is_template': 1,
      'category_id': 1,
    },
    {
      'list_id': 3,
      'title': 'test recipe 3',
      'is_template': 1,
      'category_id': 2,
    },
  ];
  static final defaultItems = [
    {'item_id': 0, 'name': 'item 1', 'list_id': 0},
    {'item_id': 1, 'name': 'item 2', 'list_id': 0},
    {'item_id': 2, 'name': 'item 3', 'list_id': 0},
    {'item_id': 3, 'name': 'item 4', 'list_id': 0},
    {'item_id': 5, 'name': 'item 5', 'list_id': 0},
    {'item_id': 6, 'name': 'item 6', 'list_id': 1},
    {'item_id': 7, 'name': 'item 7', 'list_id': 1},
    {'item_id': 8, 'name': 'item 8', 'list_id': 1},
    {'item_id': 9, 'name': 'item 9', 'list_id': 1},
    {'item_id': 10, 'name': 'item 10', 'list_id': 1},
    {'item_id': 11, 'name': 'item 11', 'list_id': 2},
    {'item_id': 12, 'name': 'item 12', 'list_id': 2},
    {'item_id': 13, 'name': 'item 13', 'list_id': 2},
    {'item_id': 14, 'name': 'item 14', 'list_id': 2},
    {'item_id': 15, 'name': 'item 15', 'list_id': 2},
    {'item_id': 16, 'name': 'item 16', 'list_id': 2},
  ];
}
