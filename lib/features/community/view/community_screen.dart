import 'package:flutter/material.dart';
import 'package:fridger/features/community/community.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
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
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CustomDishTile();
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
}
