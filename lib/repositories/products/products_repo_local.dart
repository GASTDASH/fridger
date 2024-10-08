import 'package:fridger/repositories/products/models/product.dart';
import 'package:fridger/repositories/products/products_repo_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductsRepoLocal implements ProductsRepoInterface {
  @override
  Future<void> addProduct({required Product product}) async {
    var productsBox = Hive.box<Product>('products');

    await productsBox.put(product.id, product);

    return;
  }

  @override
  Future<List<Product>> getProductsList() async {
    var productsBox = Hive.box<Product>('products');

    List<Product> productsList = [];
    productsBox.toMap().forEach(
      (key, value) {
        productsList.add(value);
      },
    );

    productsList.sort((a, b) => a.name.compareTo(b.name));

    return productsList;
  }

  @override
  Future<void> removeProduct({required int id}) async {
    var productsBox = Hive.box<Product>('products');

    productsBox.delete(id);

    return;
  }
}
