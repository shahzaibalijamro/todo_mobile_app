import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/utils/user_utils.dart';
import 'package:todo_app/views/login_page.dart';

import 'dart:math' as math;

import 'package:todo_app/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController(text: "Shahzaib Ali");
  final emailController = TextEditingController(text: "shahzaib@gmail.com");
  final emailFocusNode = FocusNode();
  final fullNameFocusNode = FocusNode();
  final passwordController = TextEditingController(text: "12345");
  final passwordFocusNode = FocusNode();
  bool obscurePassword = true;
  String? signUpError;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void saveNewUserInMemory(User user) async {
    final List<User> users = await getSavedUsersInMemory();
    users.add(user);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> usersToSave = users.map((e) => e.toJSON()).toList();
    prefs.setStringList("users", usersToSave);
  }

  void signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final fullName = fullNameController.text;
    if (fullName.trim() == "" || password.trim() == "" || email.trim() == "") {
      setState(() => signUpError = 'Cannot have empty fields!');
      return;
    }
    final users = await getSavedUsersInMemory();
    if (!mounted) return;
    User? user;
    for (final candidate in users) {
      if (candidate.email == email && candidate.password == password) {
        user = candidate;
        break;
      }
    }
    if (user != null) {
      setState(() => signUpError = 'User already exists!');
      return;
    } else {
      final newUser = User(name: fullName, email: email, password: password);
      saveNewUserInMemory(newUser);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  void goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: screenHeight * 0.1),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  // backgroundImage: AssetImage("assets/images/image.png"),
                  decoration: BoxDecoration(
                    color: AppColors.paleLavender,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 100,
                  height: 100,
                  child: const Icon(
                    Icons.check_rounded,
                    size: 84,
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Positioned(
                  top: -11,
                  child: Transform.rotate(
                    angle: math.pi / 3,
                    child: Container(
                      height: 4,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: -18,
                  child: Transform.rotate(
                    angle: math.pi / 5,
                    child: Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            spacing: 1,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create account",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  // height: 1.0,
                ),
              ),
              Text(
                "Get organized and keep your tasks in sync across all your devices.",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Full name",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: const FontWeight(700),
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                focusNode: fullNameFocusNode,
                prefixIcon: Icons.person_outline,
                controller: fullNameController,
                hint: "Enter your email",
                autoFocused: true,
                minLines: 1,
                maxLines: 1,
              ),
              const SizedBox(height: 5),
              Text(
                "Email address",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: const FontWeight(700),
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                focusNode: emailFocusNode,
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                hint: "Enter your email",
                autoFocused: true,
                minLines: 1,
                maxLines: 1,
              ),
              const SizedBox(height: 5),
              Text(
                "Password",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.darkNavyText,
                  fontWeight: const FontWeight(700),
                  fontSize: 14,
                ),
              ),
              CustomTextField(
                focusNode: passwordFocusNode,
                prefixIcon: Icons.lock_outline_rounded,
                controller: passwordController,
                hint: "Create a password",
                autoFocused: false,
                minLines: 1,
                isPassword: true,
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Use at least 8 characters.",
            style: GoogleFonts.googleSansFlex(
              color: AppColors.mutedText,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 1,
            ),
          ),
          const SizedBox(height: 7),
          if (signUpError != null) ...[
            Text(signUpError!, style: const TextStyle(color: Colors.red)),
          ],
          const SizedBox(height: 10),
          InkWell(
            onTap: signUp,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryPurple,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Create account',
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.whiteCards,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.googleSansFlex(
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: goToLogin,
                child: Text(
                  "Log in",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.primaryPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      ),
    );
  }
}
