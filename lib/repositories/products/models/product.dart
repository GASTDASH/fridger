import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  Product({
    required this.id,
    required this.name,
    required this.weight,
    this.expireDate,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int weight;
  @HiveField(3)
  DateTime? expireDate;
}
