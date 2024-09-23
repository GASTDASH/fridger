part of 'community_bloc.dart';

sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CommunityLoading extends CommunityState {}

final class CommunityLoaded extends CommunityState {
  CommunityLoaded({
    required this.dishesList,
  });

  final List<CustomDish> dishesList;
}

final class CommunityFailure extends CommunityState {
  CommunityFailure({
    required this.error,
  });

  final Object error;
}
