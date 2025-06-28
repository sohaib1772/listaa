class CategoryModel {
  final int? id;
  final String title;

  CategoryModel({this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(id: map['id'], title: map['title']);
  }
}
