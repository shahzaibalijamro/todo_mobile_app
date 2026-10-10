import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/data/users.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/views/layout_page.dart';

import 'dart:math' as math;

import 'package:todo_app/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "shahzaib@gmail.com");
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController(text: "12345");
  final passwordFocusNode = FocusNode();
  bool obscurePassword = true;
  String? loginError;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    final email = emailController.text.trim().toLowerCase();
    final password = passwordController.text;
    User? user;
    for (final candidate in users) {
      if (candidate.email.toLowerCase() == email &&
          candidate.password == password) {
        user = candidate;
        break;
      }
    }

    if (user == null) {
      setState(() => loginError = 'Email or password is incorrect');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LayoutPageScreen(user: user!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
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
                  "Welcome back",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.darkNavyText,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    height: 1.0,
                  ),
                ),
                Text(
                  "Log in to sync your tasks across all your devices.",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.mutedText,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  hint: "Enter your password",
                  autoFocused: false,
                  minLines: 1,
                  isPassword: true,
                  maxLines: 1,
                ),
                const SizedBox(height: 7),
              ],
            ),
            if (loginError != null) ...[
              Text(loginError!, style: const TextStyle(color: Colors.red)),
            ],
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.primaryPurple,
                  side: const BorderSide(color: AppColors.mutedText),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  },
                ),
                Text(
                  "Remember me",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.mutedText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.googleSansFlex(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: login,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryPurple,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Log in',
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
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.mutedText.withValues(alpha: 0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "or",
                    style: GoogleFonts.googleSansFlex(
                      color: AppColors.mutedText,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.mutedText.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteCards,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: AppColors.mutedText,
                    ),
                    Text(
                      'Continue as guest',
                      style: GoogleFonts.googleSansFlex(
                        color: AppColors.darkNavyText,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?",
                  style: GoogleFonts.googleSansFlex(
                    color: AppColors.mutedText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.googleSansFlex(
                      color: AppColors.primaryPurple,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.1),
          ],
        ),
      ),
    );
  }
}
