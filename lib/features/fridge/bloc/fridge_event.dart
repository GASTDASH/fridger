part of 'fridge_bloc.dart';

sealed class FridgeEvent {}

class FridgeLoadProducts extends FridgeEvent {}

class FridgeAddProduct extends FridgeEvent {
  FridgeAddProduct({
    required this.product,
  });

  final Product product;
}

class FridgeRemoveProduct extends FridgeEvent {
  FridgeRemoveProduct({
    required this.productName,
  });

  final String productName;
}
