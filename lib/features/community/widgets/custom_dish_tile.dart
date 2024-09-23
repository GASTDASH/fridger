import 'package:flutter/material.dart';
import 'package:fridger/repositories/dishes/models/models.dart';
import 'package:fridger/ui/ui.dart';

class CustomDishTile extends StatelessWidget {
  const CustomDishTile({
    super.key,
    required this.dish,
  });

  final CustomDish dish;

  @override
  Widget build(BuildContext context) {
    // final CustomDish dish = CustomDish(
    //   id: UniqueKey().hashCode,
    //   name: "dish.name",
    //   products: [
    //     Product(
    //       id: UniqueKey().hashCode,
    //       name: "name",
    //       weight: 1200,
    //     ),
    //   ],
    //   username: "dish.username",
    //   dateCreate: DateTime.now(),
    // );

    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // "dish.name",
                dish.name,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                dish.username,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                dish.dateCreate.toString(),
                // "dish.dateCreate",
                // "22 сентября 2024",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.hintColor.withOpacity(0.7)),
              ),
              const SizedBox(height: 12),
              Text(
                "Продукты:",
                style: theme.textTheme.titleMedium,
              ),
              Text(
                dish.products
                    .map(
                      (product) => product.name,
                    )
                    .toList()
                    .join(", "),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Text(
                "Описание:",
                style: theme.textTheme.titleSmall,
              ),
              Text(
                dish.description ?? "Без описания",
                style:
                    theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                maxLines: 8,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    onPressed: () {},
                    label: "Добавить к себе",
                    icon: Icons.add_rounded,
                    color: theme.colorScheme.primary,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
