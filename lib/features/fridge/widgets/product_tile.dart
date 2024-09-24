import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridger/features/fridge/bloc/fridge_bloc.dart';
import 'package:fridger/repositories/products/products.dart';
import 'package:fridger/ui/ui.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        BlocProvider.of<FridgeBloc>(context).add(
          FridgeRemoveProduct(id: product.id),
        );
      },
      background: Padding(
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
      direction: DismissDirection.endToStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/details");
            },
            child: SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 6, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: theme.textTheme.displaySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(2),
                        //   child: SvgPicture.asset(
                        //     "assets/icons/weight.svg",
                        //     width: 60,
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color(0xFFdadada).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              product.weight > 1000
                                  ? "${(product.weight / 1000).truncate()} кг"
                                  : "${product.weight} г",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w800),
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
          const FridgeDivider(),
        ],
      ),
    );
  }
}
