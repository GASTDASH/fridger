import 'package:flutter/material.dart';
import 'package:fridger/features/product_details/widgets/cook_type_footer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    "Детали",
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
          const CookTypeFooter(),
        ],
      ),
    );
  }
}
