import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
