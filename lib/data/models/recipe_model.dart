class RecipeModel {
  final int? id;
  final String title;
  final String description;

  RecipeModel({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
