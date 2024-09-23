import 'package:fridger/repositories/dishes/models/models.dart';

abstract class CustomDishesInterface {
  Future<List<CustomDish>> getDishes();
}
