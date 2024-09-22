import 'package:fridger/repositories/dishes/models/dish.dart';

class CustomDish extends Dish {
  CustomDish({
    required super.id,
    required super.name,
    required super.products,
    super.description,
    required this.username,
    required this.dateCreate,
  });

  String username;
  DateTime dateCreate;
}
