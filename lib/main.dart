import 'package:flutter/material.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      // home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
