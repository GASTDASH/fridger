import 'package:flutter/material.dart';
import 'package:fridger/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreenIndex,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            selectedScreenIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Холодильник",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Блюда",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Настройки",
          ),
        ],
      ),
      body: Builder(builder: (context) {
        return screens[selectedScreenIndex];
      }),
    );
  }
}
