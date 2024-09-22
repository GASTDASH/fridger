import 'package:flutter_bloc/flutter_bloc.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<CommunityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
