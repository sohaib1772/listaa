class CategoryModel {
  final int? id;
  final String title;
  final bool isDefault;

  CategoryModel({this.id, required this.title, required this.isDefault});

  Map<String, dynamic> toMap() {
    return {'category_id': id, 'title': title, 'is_default': isDefault};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['category_id'],
      title: map['title'],
      isDefault: map['is_default'] == 1 ? true : false,
    );
  }
}
