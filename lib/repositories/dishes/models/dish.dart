import 'package:fridger/repositories/products/products.dart';

class Dish {
  Dish({
    required this.id,
    required this.name,
    required this.products,
    this.description,
  });

  int id;
  String name;
  List<Product> products;
  String? description;
}
