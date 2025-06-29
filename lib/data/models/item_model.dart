class ItemModel {
  final int? id;
  final String name;
  final String icon;
  final double price;
   bool isDone;


  ItemModel({this.id, required this.name, required this.icon, required this.price,required this.isDone});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'price': price};
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
      price: map['price'],
      isDone: map['isDone'],
    );
  }
}
