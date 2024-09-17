part of 'fridge_bloc.dart';

sealed class FridgeState {}

final class FridgeInitial extends FridgeState {}

final class FridgeLoading extends FridgeState {}

final class FridgeLoaded extends FridgeState {
  FridgeLoaded({
    required this.productsList,
  });

  final List<Product> productsList;
}

final class FridgeFailure extends FridgeState {
  FridgeFailure(this.error);

  final Object error;
}
