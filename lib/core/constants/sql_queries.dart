class SqlQueries {
  static const String getAllLists = '''
 SELECT 
    lists.list_id,
    lists.title,
    lists.date,
    lists.time,
    lists.total_price,
    lists.priority,
    lists.is_deleted,
    lists.is_collapsed,
    lists.is_template,
    lists.category_id,
    items.item_id,
    items.name,
    items.price,
    items.is_done
  FROM 
    lists
  LEFT JOIN 
    items ON items.list_id = lists.list_id
  WHERE lists.is_deleted = 0 AND lists.is_template = 0
  ORDER BY 
    lists.list_id DESC, items.item_id;
''';
  static const String getListsByPriority = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.time,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    l.is_template,
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.is_template = 0 AND l.priority = ?
  ORDER BY l.list_id DESC, l.list_id, i.item_id
''';
  static const String getListsByCategory = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.time,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    l.is_template,
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.is_template = 0 AND l.category_id = ?
  ORDER BY l.list_id DESC, l.list_id, i.item_id
''';
  static const String getListsByCategoryAndPriority = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.time,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    l.is_template,
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND AND l.is_template = 0 l.category_id = ? AND l.priority = ?
  ORDER BY l.list_id DESC, l.list_id, i.item_id
''';
  //
  static const String createNewList = '''
    INSERT INTO lists (
      title, 
      date,
      time,
      total_price, 
      priority, 
      is_deleted, 
      is_collapsed,
      category_id,
      is_template
    ) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''';

  static const String createNewItem = '''
    INSERT INTO items (
      name, 
      price, 
      is_done, 
      list_id
    ) 
    VALUES (?, ?, ?, ?)
  ''';
  static const String getRemindersList = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.time,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    l.is_template,
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE i.is_done = 0 AND l.is_template = 0 AND l.is_deleted = 0
  ORDER BY l.date DESC, l.list_id, i.item_id
''';
  static const String getSoftDeletedListsWithItems = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.time,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    l.is_template,
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done AS item_is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 1 AND l.is_template = 0
  ORDER BY l.date DESC, l.list_id, i.item_id
''';
  static const String deleteList = '''
  DELETE FROM lists 
  WHERE list_id = ?
  ''';

  static const String deleteListItems = '''
  DELETE FROM items 
  WHERE list_id = ?
  ''';

  static const String softDeleteList = '''
  UPDATE lists 
  SET is_deleted = 1 
  WHERE list_id = ?
''';

  static const String restoreList = '''
  UPDATE lists 
  SET is_deleted = 0 
  WHERE list_id = ?
''';

  static const String getCategories = '''
  Select * from categories
''';

  static const String createNewCategory = '''
    INSERT INTO categories (
      title, 
      is_default
    ) 
    VALUES (?, ?)
  ''';

  static const String getListsBelongsToCategory = '''
  SELECT 
    l.list_id,
    c.category_id
  FROM lists l
  JOIN categories c ON l.category_id = c.category_id
  WHERE c.category_id = ?
  ''';

  static const String deleteCategory = '''
  DELETE FROM categories 
  WHERE category_id = ?
  ''';

  static const String changeItemIsDone = '''
  UPDATE items 
  SET is_done = ?
  WHERE item_id = ?
  ''';

  static const String updateList = '''
  UPDATE lists 
  SET 
    title = ?,
    date = ?,
    time = ?,
    total_price = ?,
    priority = ?,
    is_deleted = ?,
    is_collapsed = ?,
    category_id = ?
  WHERE list_id = ?
''';
  //Money Report Queries

  static const String spendingInGeneral = '''
  SELECT 
    c.title as category,
    SUM(i.price) as total_spent,
    COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
  LEFT JOIN items i ON l.list_id = i.list_id AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String spendingByWeek = '''
  SELECT
      c.title as category,
      SUM(i.price) as total_spent,
      COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
      AND datetime(l.date) BETWEEN datetime('now', 'localtime', '-6 days') AND datetime('now', 'localtime', '+1 day')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String spendingToday = '''
  SELECT
      c.title as category,
      SUM(i.price) as total_spent,
      COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
      AND date(l.date) = date('now', 'localtime')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String spendingCurrentMonth = '''
  SELECT
      c.title as category,
      SUM(i.price) as total_spent,
      COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
      AND date(l.date) BETWEEN date('now', 'start of month', 'localtime')
                         AND date('now', 'localtime')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String spendingPreviousMonth = '''
  SELECT
      c.title as category,
      SUM(i.price) as total_spent,
      COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
      AND date(l.date) BETWEEN date('now', 'start of month', '-1 month', 'localtime')
                         AND date('now', 'start of month', '-1 day', 'localtime')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String spendingCurrentYear = '''
  SELECT
      c.title as category,
      SUM(i.price) as total_spent,
      COUNT(DISTINCT l.list_id) as lists_count
  FROM categories c
  LEFT JOIN lists l ON c.category_id = l.category_id
      AND date(l.date) BETWEEN date('now', 'start of year', 'localtime')
                         AND date('now', 'localtime')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';

  static const String createRecipeItem = '''
    INSERT INTO items (
      item_id,
      name, 
      list_id
    ) 
    VALUES (?, ?, ?)
  ''';

  static const String getRecipes = '''
 SELECT 
    lists.list_id,
    lists.title,
    lists.date,
    lists.is_collapsed,
    lists.is_template,
    lists.is_deleted,
    lists.category_id,
    items.item_id,
    items.name,
    items.price
  FROM 
    lists
  LEFT JOIN 
    items ON items.list_id = lists.list_id
  WHERE lists.is_template = 1 AND lists.is_deleted = 0
  ORDER BY
    lists.date DESC, items.item_id;
''';
}
