import 'package:flutter/material.dart';
import 'package:fridger/ui/ui.dart';

class CustomDishTile extends StatelessWidget {
  const CustomDishTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                "dish.name",
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                "dish.username",
                style: theme.textTheme.titleMedium,
              ),
              Text(
                "dish.dateCreate",
                // "22 сентября 2024",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.hintColor.withOpacity(0.7)),
              ),
              const SizedBox(height: 12),
              Text(
                "Описание:",
                style: theme.textTheme.titleSmall,
              ),
              Text(
                "dish.description\nописание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание описание",
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
