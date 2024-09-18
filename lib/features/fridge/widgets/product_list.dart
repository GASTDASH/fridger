import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fridger/repositories/products/products.dart';
import 'package:get_it/get_it.dart';

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
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            //TODO
          },
          background: Container(
            color: theme.dividerTheme.color,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Удалить",
                      style: theme.textTheme.bodyLarge,
                    ),
                    const Icon(Icons.delete_outline),
                  ],
                ),
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 6, right: 20),
                  child: index == productsList.length
                      ? GestureDetector(
                          onTap: () {
                            GetIt.I<ProductsRepoInterface>().addProduct(
                              //TODO
                              product: Product(name: "Test", weight: 123),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                "assets/icons/add.svg",
                                height: 30,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Добавить",
                                style: theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/details");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productsList[index].name,
                                style: theme.textTheme.displaySmall,
                                overflow: TextOverflow.fade,
                              ),
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/weight.svg",
                                    height: 55,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 25,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFdadada)
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Center(
                                        child: Text(
                                          productsList[index].weight.toString(),
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: theme.dividerTheme.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
