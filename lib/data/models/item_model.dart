class Item {
  final int? id;
  final String name;
  final String icon;
  final double price;

  Item({this.id, required this.name, required this.icon, required this.price});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'price': price};
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      icon: map['icon'],
      price: map['price'],
    );
  }
}
