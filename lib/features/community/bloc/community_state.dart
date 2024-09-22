part of 'community_bloc.dart';

sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CommunityLoading extends CommunityState {}

final class CommunityLoaded extends CommunityState {}

final class CommunityFailure extends CommunityState {}
