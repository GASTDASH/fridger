import 'package:flutter/material.dart';
import 'package:fridger/features/dishes/widgets/add_card.dart';
import 'package:fridger/features/dishes/widgets/dish_card.dart';

class DishesList extends StatefulWidget {
  const DishesList({
    super.key,
  });

  @override
  State<DishesList> createState() => _DishesListState();
}

class _DishesListState extends State<DishesList> {
  final int length = 6;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 200,
        ),
        itemCount: length + 1,
        itemBuilder: (context, index) {
          index--;

          if (index == -1) {
            return const AddCard();
          } else {
            return const DishCard();
          }
        },
      ),
    );
  }
}
