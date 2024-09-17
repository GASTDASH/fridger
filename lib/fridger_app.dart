import 'package:flutter/material.dart';
import 'package:fridger/features/fridge/view/view.dart';
import 'package:fridger/features/product_details/view/product_details_screen.dart';
import 'package:fridger/ui/theme/theme.dart';

class FridgerApp extends StatelessWidget {
  const FridgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fridger',
      theme: lightTheme,
      routes: {
        "/": (context) => const FridgeScreen(),
        "/details": (context) => const ProductDetailsScreen(),
      },
    );
  }
}
