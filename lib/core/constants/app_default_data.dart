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
      'title': AppLocaleKeys.adha, // عيد الاضحى
      'is_template': 1,
      'category_id': 0,
    },
    {
      'list_id': 2,
      'title': AppLocaleKeys.cake, // كيكة بالشوكلاته
      'is_template': 1,
      'category_id': 1,
    },
    {
      'list_id': 3,
      'title':  AppLocaleKeys.trip, // رحلة  تخييم مع الاصدقاء
      'is_template': 1,
      'category_id': 2,
    },
    {
      'list_id': 4,
      'title':  AppLocaleKeys.chicken, // وصفة دجاجة شهية
      'is_template': 1,
      'category_id': 2,
    },
    {
      'list_id': 5,
      'title':  AppLocaleKeys.market, // تسوق للمنزل
      'is_template': 1,
      'category_id': 2,
    },
    {
      'list_id': 6,
      'title':  AppLocaleKeys.school, // تجهيزات المدرسة
      'is_template': 1,
      'category_id': 2,
    },
  ];
 static final defaultItems = [
  // 🐑 عيد الأضحى (list_id: 1)
  {'item_id': 0, 'name': AppLocaleKeys.adha_sheep, 'price': 0, 'list_id': 1},
  {'item_id': 1, 'name': AppLocaleKeys.adha_knife, 'price': 0, 'list_id': 1},
  {'item_id': 2, 'name': AppLocaleKeys.adha_charcoal, 'price': 0, 'list_id': 1},
  {'item_id': 3, 'name': AppLocaleKeys.adha_salt, 'price': 0, 'list_id': 1},
  {'item_id': 4, 'name': AppLocaleKeys.adha_spices, 'price': 0, 'list_id': 1},
  {'item_id': 5, 'name': AppLocaleKeys.adha_bags, 'price': 0, 'list_id': 1},
  {'item_id': 6, 'name': AppLocaleKeys.adha_gloves, 'price': 0, 'list_id': 1},
  {'item_id': 7, 'name': AppLocaleKeys.adha_tray, 'price': 0, 'list_id': 1},
  {'item_id': 8, 'name': AppLocaleKeys.adha_cleaning_supplies, 'price': 0, 'list_id': 1},
  {'item_id': 9, 'name': AppLocaleKeys.adha_freezer_bags, 'price': 0, 'list_id': 1},

  // 🎂 كيكة بالشوكولاتة (list_id: 2)
  {'item_id': 10, 'name': AppLocaleKeys.cake_flour, 'price': 0, 'list_id': 2},
  {'item_id': 11, 'name': AppLocaleKeys.cake_sugar, 'price': 0, 'list_id': 2},
  {'item_id': 12, 'name': AppLocaleKeys.cake_eggs, 'price': 0, 'list_id': 2},
  {'item_id': 13, 'name': AppLocaleKeys.cake_cocoa, 'price': 0, 'list_id': 2},
  {'item_id': 14, 'name': AppLocaleKeys.cake_butter, 'price': 0, 'list_id': 2},
  {'item_id': 15, 'name': AppLocaleKeys.cake_baking_powder, 'price': 0, 'list_id': 2},
  {'item_id': 16, 'name': AppLocaleKeys.cake_vanilla, 'price': 0, 'list_id': 2},

  // 🏕️ رحلة تخييم (list_id: 3)
  {'item_id': 17, 'name': AppLocaleKeys.trip_tent, 'price': 0, 'list_id': 3},
  {'item_id': 18, 'name': AppLocaleKeys.trip_sleeping_bag, 'price': 0, 'list_id': 3},
  {'item_id': 19, 'name': AppLocaleKeys.trip_firewood, 'price': 0, 'list_id': 3},
  {'item_id': 20, 'name': AppLocaleKeys.trip_lantern, 'price': 0, 'list_id': 3},
  {'item_id': 21, 'name': AppLocaleKeys.trip_water, 'price': 0, 'list_id': 3},
  {'item_id': 22, 'name': AppLocaleKeys.trip_snacks, 'price': 0, 'list_id': 3},
  {'item_id': 23, 'name': AppLocaleKeys.trip_first_aid, 'price': 0, 'list_id': 3},

  // 🍗 وصفة دجاجة شهية (list_id: 4)
  {'item_id': 24, 'name': AppLocaleKeys.chicken_whole, 'price': 0, 'list_id': 4},
  {'item_id': 25, 'name': AppLocaleKeys.chicken_garlic, 'price': 0, 'list_id': 4},
  {'item_id': 26, 'name': AppLocaleKeys.chicken_lemon, 'price': 0, 'list_id': 4},
  {'item_id': 27, 'name': AppLocaleKeys.chicken_pepper, 'price': 0, 'list_id': 4},
  {'item_id': 28, 'name': AppLocaleKeys.chicken_yogurt, 'price': 0, 'list_id': 4},
  {'item_id': 29, 'name': AppLocaleKeys.chicken_rice, 'price': 0, 'list_id': 4},

  // 🛒 تسوق للمنزل (list_id: 5)
  {'item_id': 30, 'name': AppLocaleKeys.market_bread, 'price': 0, 'list_id': 5},
  {'item_id': 31, 'name': AppLocaleKeys.market_milk, 'price': 0, 'list_id': 5},
  {'item_id': 32, 'name': AppLocaleKeys.market_eggs, 'price': 0, 'list_id': 5},
  {'item_id': 33, 'name': AppLocaleKeys.market_cheese, 'price': 0, 'list_id': 5},
  {'item_id': 34, 'name': AppLocaleKeys.market_vegetables, 'price': 0, 'list_id': 5},
  {'item_id': 35, 'name': AppLocaleKeys.market_fruits, 'price': 0, 'list_id': 5},
  {'item_id': 36, 'name': AppLocaleKeys.market_oil, 'price': 0, 'list_id': 5},

  // 🎒 تجهيزات المدرسة (list_id: 6)
  {'item_id': 37, 'name': AppLocaleKeys.school_backpack, 'price': 0, 'list_id': 6},
  {'item_id': 38, 'name': AppLocaleKeys.school_notebooks, 'price': 0, 'list_id': 6},
  {'item_id': 39, 'name': AppLocaleKeys.school_pens, 'price': 0, 'list_id': 6},
  {'item_id': 40, 'name': AppLocaleKeys.school_uniform, 'price': 0, 'list_id': 6},
  {'item_id': 41, 'name': AppLocaleKeys.school_shoes, 'price': 0, 'list_id': 6},
  {'item_id': 42, 'name': AppLocaleKeys.school_lunchbox, 'price': 0, 'list_id': 6},
  {'item_id': 43, 'name': AppLocaleKeys.school_water_bottle, 'price': 0, 'list_id': 6},
];
}
