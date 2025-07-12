class SqlStrings {
  // Categories table
  static const String createCategoriesTable = '''
    CREATE TABLE categories (
      category_id INTEGER PRIMARY KEY,
      title TEXT,
      is_default INTEGER DEFAULT 0
    )
  ''';

  // Lists table
  static const String createListsTable = '''
    CREATE TABLE lists (
      list_id INTEGER PRIMARY KEY,
      title TEXT,
      date DATETIME DEFAULT CURRENT_TIMESTAMP,
      time DATETIME DEFAULT CURRENT_TIMESTAMP,
      total_price REAL DEFAULT 0.0,
      priority INTEGER DEFAULT 0,
      is_deleted INTEGER DEFAULT 0,
      is_collapsed INTEGER DEFAULT 0,
      is_template INTEGER DEFAULT 0,
      category_id INTEGER,
      FOREIGN KEY (category_id) REFERENCES categories(category_id)
    )
  ''';

  // Items table (one-to-many relationship)
  static const String createItemsTable = '''
    CREATE TABLE items (
      item_id INTEGER PRIMARY KEY,
      name TEXT,
      price REAL DEFAULT 0.0,
      is_done INTEGER DEFAULT 0,
      list_id INTEGER,
      FOREIGN KEY (list_id) REFERENCES lists(list_id)
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

  // Combined create all tables
  static List<String> get createAllTables => [
    createCategoriesTable,
    createListsTable,
    createItemsTable,
    createRemindersTable,
  ];
}
