import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              "Настройки",
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
