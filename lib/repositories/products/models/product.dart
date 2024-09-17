import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  Product({
    required this.name,
    required this.weight,
    this.expireDate,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  int weight;
  @HiveField(2)
  DateTime? expireDate;
}
