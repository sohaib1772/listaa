class CategoryModel {
  final int? id;
  final String title;
  final bool isDefault;

  CategoryModel({this.id, required this.title, required this.isDefault});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'is_default': isDefault};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      title: map['title'],
      isDefault: map['is_default'],
    );
  }
}
