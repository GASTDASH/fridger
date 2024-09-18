import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridger/repositories/products/products.dart';
import 'package:get_it/get_it.dart';

part 'fridge_event.dart';
part 'fridge_state.dart';

class FridgeBloc extends Bloc<FridgeEvent, FridgeState> {
  FridgeBloc() : super(FridgeInitial()) {
    on<FridgeLoadProducts>((event, emit) async {
      emit(FridgeLoading());

      try {
        var productsList =
            await GetIt.I<ProductsRepoInterface>().getProductsList();

        emit(
          FridgeLoaded(
            productsList: productsList,
          ),
        );
      } catch (e) {
        emit(FridgeFailure(e));
      }
    });
    on<FridgeAddProduct>(
      (event, emit) async {
        emit(FridgeLoading());

        try {
          GetIt.I<ProductsRepoInterface>().addProduct(
            product: event.product,
          );

          add(FridgeLoadProducts());
        } catch (e) {
          emit(FridgeFailure(e));
        }
      },
    );
    on<FridgeRemoveProduct>(
      (event, emit) async {
        emit(FridgeLoading());

        try {
          GetIt.I<ProductsRepoInterface>().removeProduct(
            id: event.id,
          );

          add(FridgeLoadProducts());
        } catch (e) {
          emit(FridgeFailure(e));
        }
      },
    );
  }
}
