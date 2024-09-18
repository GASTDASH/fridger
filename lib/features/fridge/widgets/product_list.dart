import 'package:flutter/material.dart';
import 'package:fridger/features/fridge/widgets/add_product_tile.dart';
import 'package:fridger/features/fridge/widgets/product_tile.dart';
import 'package:fridger/repositories/products/products.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productsList,
  });

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverList.builder(
      itemCount: productsList.length + 1,
      itemBuilder: (context, index) {
        return index == productsList.length
            ? const AddProductTile()
            : ProductTile(product: productsList[index]);
      },
    );
  }
}
