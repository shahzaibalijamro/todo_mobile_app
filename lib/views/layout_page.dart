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

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [TaskScreen(username: widget.username), const ProfileScreen()];
  }

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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Focus"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
