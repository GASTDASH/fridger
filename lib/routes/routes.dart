import 'package:flutter/material.dart';
import 'package:fridger/community/view/community_screen.dart';
import 'package:fridger/dishes/view/dishes_screen.dart';
import 'package:fridger/features/fridge/view/view.dart';
import 'package:fridger/features/home/view/home_screen.dart';
import 'package:fridger/features/product_details/view/product_details_screen.dart';
import 'package:fridger/features/settings/view/settings_screen.dart';

final routes = {
  "/": (context) => const HomeScreen(),
  "/fridge": (context) => const FridgeScreen(),
  "/details": (context) => const ProductDetailsScreen(),
};

final List<Widget> screens = [
  const FridgeScreen(),
  const DishesScreen(),
  const CommunityScreen(),
  const SettingsScreen(),
];
