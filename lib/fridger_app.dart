import 'package:flutter/material.dart';
import 'package:fridger/routes/routes.dart';
import 'package:fridger/ui/ui.dart';

class FridgerApp extends StatelessWidget {
  const FridgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fridger',
      theme: lightTheme,
      routes: routes,
    );
  }
}
