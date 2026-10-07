import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/views/calendar_page.dart';
import 'package:todo_app/views/focus_page.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/profile_page.dart';
import 'package:material_symbols_icons/symbols.dart';

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

        selectedItemColor: const Color(CustomColors.primaryPurple),
        unselectedItemColor: const Color(CustomColors.mutedText),
        showUnselectedLabels: true,
        iconSize: 30,
        backgroundColor: const Color(CustomColors.whiteCards),
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.circle_circle),
            label: "Focus",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
