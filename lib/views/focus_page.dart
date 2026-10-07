import 'package:flutter/material.dart';

class FocusScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Focus Page"));
  }
}
