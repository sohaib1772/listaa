class SqlStrings {
  // Categories table
  static const String createCategoriesTable = '''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY,
      title TEXT
    )
  ''';

  // Lists table
  static const String createListsTable = '''
    CREATE TABLE lists (
      id INTEGER PRIMARY KEY,
      title TEXT,
      date DATETIME,
      total_amount REAL,
      priority INTEGER,
      is_deleted INTEGER,  // SQLite doesn't have BOOLEAN, using INTEGER (0 or 1)
    )
  ''';

  // Items table
  static const String createItemsTable = '''
    CREATE TABLE items (
      id INTEGER PRIMARY KEY,
      name TEXT,
      icon TEXT,
      price REAL
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

  // ListItems table (many-to-many relationship)
  static const String createListItemsTable = '''
    CREATE TABLE list_items (
      id INTEGER PRIMARY KEY,
      buy_price REAL,
      item_id INTEGER,
      list_id INTEGER,
      buy_date DATETIME,
      is_done INTEGER,  // SQLite doesn't have BOOLEAN, using INTEGER (0 or 1)
      FOREIGN KEY (item_id) REFERENCES items(id),
      FOREIGN KEY (list_id) REFERENCES lists(id)
    )
  ''';

  // Reminders table
  static const String createRemindersTable = '''
    CREATE TABLE reminders (
      id INTEGER PRIMARY KEY,
      date DATETIME,
      list_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES lists(id)
    )
  ''';

  // Recipes table
  static const String createRecipesTable = '''
    CREATE TABLE recipes (
      id INTEGER PRIMARY KEY,
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
    createListItemsTable,
    createRemindersTable,
    createRecipesTable,
    createRecipesItemsTable,
  ];
}
