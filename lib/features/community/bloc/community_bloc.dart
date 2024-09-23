import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridger/repositories/dishes/dishes.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<CommunityGetDishes>(_getDishes);
  }

  FutureOr<void> _getDishes(event, emit) async {
    emit(CommunityLoading());

    try {
      final List<CustomDish> dishesList =
          await GetIt.I.call<CustomDishesInterface>().getDishes();

      GetIt.I<Talker>().debug(dishesList);

      emit(CommunityLoaded(dishesList: dishesList));
    } catch (e) {
      emit(CommunityFailure(error: e));
    }
  }
}
