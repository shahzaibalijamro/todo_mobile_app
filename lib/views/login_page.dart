import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/views/layout_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  final names = [];
  bool isProtected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                "Login Screen",
                style: GoogleFonts.abhayaLibre(
                  textStyle: const TextStyle(fontSize: 46, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24),
              Container(height: 150, width: 120, color: Colors.green),
              const SizedBox(height: 36),
              TextField(
                obscureText: isProtected,
                controller: usernameController,
                // autofillHints: const [AutoFillHints.email],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                  hint: const Text("John Doe"),
                  label: const Text("Enter your username"),
                  prefix: const Icon(Icons.person),
                  suffix: IconButton(
                    onPressed: () {
                      isProtected = !isProtected;
                      setState(() {});
                    },
                    icon: Icon(
                      isProtected ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LayoutPageScreen(username: username);
                      },
                    ),
                  );
                },
                child: const Text("USERNAME"),
              ),
              const SizedBox(height: 34),
              Expanded(
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Text(
                      names[index],
                      style: const TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
