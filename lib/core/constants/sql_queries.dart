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
    lists.category_id,
    items.item_id,
    items.name,
    items.price,
    items.is_done
  FROM 
    lists
  LEFT JOIN 
    items ON items.list_id = lists.list_id
  WHERE lists.is_deleted = 0 
  ORDER BY 
    lists.date DESC, items.item_id;
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
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.priority = ?
  ORDER BY l.date DESC, l.list_id, i.item_id
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
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.category_id = ?
  ORDER BY l.date DESC, l.list_id, i.item_id
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
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.category_id = ? AND l.priority = ?
  ORDER BY l.date DESC, l.list_id, i.item_id
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
      category_id
    ) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
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
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE i.is_done = 0
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
    l.category_id,
    i.item_id,
    i.name,
    i.price,
    i.is_done AS item_is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 1
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
      AND strftime('%Y-%W', l.date) = strftime('%Y-%W', 'now', 'localtime', '-7 days')
  LEFT JOIN items i ON l.list_id = i.list_id 
      AND i.is_done = 1
  GROUP BY c.category_id
  ORDER BY total_spent DESC
''';
}
