import 'package:flutter/material.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/profile_page.dart';

class LayoutPageScreen extends StatefulWidget {
  final String username;
  const new({super.key, required this.username});

  @override
  State<LayoutPageScreen> createState() => _LayoutPageScreenState();
}

class _LayoutPageScreenState extends State<LayoutPageScreen> {
  int currentIndex = 0;
  List<Widget> screens = [TaskScreen(username: "Alex"), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
