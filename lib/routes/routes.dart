import 'package:fridger/features/fridge/view/view.dart';
import 'package:fridger/features/home/view/home_screen.dart';
import 'package:fridger/features/product_details/view/product_details_screen.dart';

final routes = {
  "/": (context) => const HomeScreen(),
  "/fridge": (context) => const FridgeScreen(),
  "/details": (context) => const ProductDetailsScreen(),
};
