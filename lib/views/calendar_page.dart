import 'package:flutter/material.dart';
import 'package:todo_app/views/layout_page.dart';
import 'package:todo_app/widgets/app_bar.dart';

class CalendarScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [MyAppBar(page: Screen.calendar)],
    );
  }
}
