class SqlStrings {
  // Categories table
  static const String createCategoriesTable = '''
    CREATE TABLE categories (
      category_id INTEGER PRIMARY KEY,
      title TEXT
    )
  ''';

  // Lists table
  static const String createListsTable = '''
    CREATE TABLE lists (
      list_id INTEGER PRIMARY KEY,
      title TEXT,
      date DATETIME,
      total_price REAL,
      priority INTEGER,
      is_deleted INTEGER,
      is_collapsed INTEGER
    )
  ''';

  // Items table (one-to-many relationship)
  static const String createItemsTable = '''
    CREATE TABLE items (
      item_id INTEGER PRIMARY KEY,
      name TEXT,
      price REAL,
      is_done INTEGER,
      list_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES lists(list_id)
    )
  ''';

  // ListCategories table (many-to-many relationship)
  static const String createListCategoriesTable = '''
    CREATE TABLE list_categories (
      id INTEGER PRIMARY KEY,
      list_id INTEGER,
      category_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES lists(id),
      FOREIGN KEY (category_id) REFERENCES categories(id)
    )
  ''';

  // Reminders table
  static const String createRemindersTable = '''
    CREATE TABLE reminders (
      reminder_id INTEGER PRIMARY KEY,
      date DATETIME,
      list_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES lists(id)
    )
  ''';

  // Recipes table
  static const String createRecipesTable = '''
    CREATE TABLE recipes (
      recipe_id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT
    )
  ''';

  // RecipesItems table (many-to-many relationship)
  static const String createRecipesItemsTable = '''
    CREATE TABLE recipes_items (
      id INTEGER PRIMARY KEY,
      recipe_id INTEGER,
      item_id INTEGER,
      FOREIGN KEY (recipe_id) REFERENCES recipes(id),
      FOREIGN KEY (item_id) REFERENCES items(id)
    )
  ''';

  // Combined create all tables
  static List<String> get createAllTables => [
    createCategoriesTable,
    createListsTable,
    createItemsTable,
    createListCategoriesTable,
    createRemindersTable,
    createRecipesTable,
    createRecipesItemsTable,
  ];
}
