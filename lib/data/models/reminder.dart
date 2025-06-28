class ReminderModel {
  final int? id;
  final DateTime date;
  final int listId;

  ReminderModel({this.id, required this.date, required this.listId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'list_id': listId,
    };
  }

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'],
      date: DateTime.parse(map['date']),
      listId: map['list_id'],
    );
  }
}