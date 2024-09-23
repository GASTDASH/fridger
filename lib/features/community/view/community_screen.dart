import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridger/features/community/bloc/community_bloc.dart';
import 'package:fridger/features/community/community.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final _communityBloc = CommunityBloc();

  @override
  void initState() {
    super.initState();

    getDishes();
  }

  void getDishes() {
    _communityBloc.add(CommunityGetDishes());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<CommunityBloc, CommunityState>(
        bloc: _communityBloc,
        builder: (context, state) {
          if (state is CommunityLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                getDishes();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: Text(
                      "Сообщество",
                      style: theme.textTheme.headlineLarge
                          ?.copyWith(color: theme.hintColor),
                    ),
                    elevation: 2,
                    shadowColor: Colors.black,
                  ),
                  SliverList.separated(
                    itemCount: state.dishesList.length,
                    itemBuilder: (context, index) {
                      return CustomDishTile(
                        dish: state.dishesList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 0,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          if (state is CommunityLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CommunityInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CommunityFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: theme.textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    state.error.toString(),
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  const Icon(
                    Icons.warning_amber,
                    size: 80,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Error",
                  style: theme.textTheme.displayMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "Unexpected state",
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                const Icon(
                  Icons.warning_amber,
                  size: 80,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
