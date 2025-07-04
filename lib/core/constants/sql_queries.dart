class SqlQueries {
  static const String getAllHomeLists = '''
 SELECT 
    lists.list_id,
    lists.title,
    lists.date,
    lists.total_price,
    lists.priority,
    lists.is_deleted,
    lists.is_collapsed,
    items.item_id,
    items.name,
    items.price,
    items.is_done
  FROM 
    lists
  LEFT JOIN 
    items ON items.item_id = lists.list_id
  WHERE lists.is_deleted = 0 
  ORDER BY 
    lists.list_id, items.item_id;
''';
  static const String getHomeListsByPriority = '''
  SELECT 
    l.list_id,
    l.title,
    l.date,
    l.total_price,
    l.priority,
    l.is_deleted,
    l.is_collapsed,
    i.item_id,
    i.name AS item_name,
    i.price AS item_price,
    i.is_done AS item_is_done
  FROM lists l
  LEFT JOIN items i ON i.list_id = l.list_id
  WHERE l.is_deleted = 0 AND l.priority = ?
  ORDER BY l.date DESC, l.list_id, i.item_id
''';
}
