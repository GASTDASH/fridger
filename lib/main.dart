import 'package:flutter/material.dart';
import 'package:fridger/fridger_app.dart';
import 'package:fridger/repositories/products/products.dart';
import 'package:fridger/repositories/products/products_repo_interface.dart';
import 'package:fridger/repositories/products/products_repo_local.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  var productsBox = await Hive.openBox<Product>('products');

  final talker = Talker();

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerSingleton<ProductsRepoInterface>(
    ProductsRepoLocal(),
  );

  runApp(const FridgerApp());
}
