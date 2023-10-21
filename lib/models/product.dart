class Product{
  String? id;
  String? name;
  int? price;

  Product.fromMap(Map map){
    name = map['name'];
    price = map['price'];
  }
}