import 'package:fridger/repositories/products/products.dart';

abstract class ProductsRepoInterface {
  ProductsRepoInterface();

  Future<List<Product>> getProductsList();
  Future<void> addProduct({required Product product});
  Future<void> removeProduct({required int id});
}
