import 'package:flutter/material.dart';
import 'package:fridger/features/fridge/widgets/widgets.dart';

class FridgeScreen extends StatelessWidget {
  const FridgeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Холодильник",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Блюда",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Настройки",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text(
                    "Холодильник",
                    style: theme.textTheme.headlineLarge
                        ?.copyWith(color: theme.hintColor),
                  ),
                  elevation: 2,
                  shadowColor: Colors.black,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Наличие продуктов:",
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(color: theme.hintColor),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(bottom: 24),
                  sliver: const ProductList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: Local Storage
// TODO: JSON ser....
// TODO: AutoRouter
