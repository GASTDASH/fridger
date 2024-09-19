import 'package:flutter/material.dart';
import 'package:fridger/features/dishes/dishes.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({super.key});

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              "Мои блюда",
              style: theme.textTheme.headlineLarge
                  ?.copyWith(color: theme.hintColor),
            ),
            elevation: 2,
            shadowColor: Colors.black,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const DishesList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
