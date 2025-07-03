class SqlQueries {
  static const String getAllHomeListsQuery = '''
       SELECT 
  lists.id,
  lists.title,
  lists.date,
  lists.total_price,
  lists.priority,
  lists.is_deleted,
  items.id,
  items.name,
  items.icon,
  items.price,
  items.is_done
FROM 
  lists
LEFT JOIN 
  items ON items.list_id = lists.id
ORDER BY 
  lists.id, items.id;
''';
}
