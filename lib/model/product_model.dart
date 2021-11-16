class Product {
  int? id;
  String? name;
  double? price;

  Product(this.id, this.name, this.price);
  int? get getId => id;
  String? get getName => name;
  double? get getPrice => price;
  String toString() {
    return "Product" + "$id" + "\n"+ "$name" + "\n" + "$price";
  }
}
