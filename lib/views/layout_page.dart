import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/views/calendar_page.dart';
import 'package:todo_app/views/focus_page.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/profile_page.dart';
import 'package:material_symbols_icons/symbols.dart';

enum Screen { home, calendar, focus, profile }

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
    screens = [
      TaskScreen(username: widget.username),
      const CalendarScreen(),
      const FocusScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CustomColors.backgroundColor),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        selectedLabelStyle: GoogleFonts.googleSansFlex(fontSize: 14),
        unselectedLabelStyle: GoogleFonts.googleSansFlex(fontSize: 14),
        showSelectedLabels: false,
        selectedItemColor: const Color(CustomColors.primaryPurple),
        unselectedItemColor: const Color(CustomColors.mutedText),
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(CustomColors.whiteCards),
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.home),
                const Text("Home"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            label: "Home",
            activeIcon: Column(
              children: [
                const Icon(Icons.home),
                const Text("Home"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(CustomColors.primaryPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(Icons.calendar_today_outlined),
                const Text("Calendar"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            label: "Calendar",
            activeIcon: Column(
              children: [
                const Icon(Icons.calendar_today_outlined),
                const Text("Calendar"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(CustomColors.primaryPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(Symbols.circle_circle),
                const Text("Focus"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            label: "Focus",
            activeIcon: Column(
              children: [
                const Icon(Symbols.circle_circle),
                const Text("Focus"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(CustomColors.primaryPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(Icons.person),
                const Text("Profile"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            label: "Profile",
            activeIcon: Column(
              children: [
                const Icon(Icons.person),
                const Text("Profile"),
                const SizedBox(height: 5),
                Container(
                  width: 25,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(CustomColors.primaryPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
