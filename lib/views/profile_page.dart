import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/date_time_utils.dart';
import 'package:todo_app/views/login_page.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widgets/custom_toggle.dart';

import '../views/layout_page.dart';

class ProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  bool remindMe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              customAppBar(page: Screen.profile),
              const SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.paleLavender,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Alex Morgan",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight(700),
                      color: AppColors.darkNavyText,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Grade 8 · Section B",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight(500),
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Text(
                  "Account",
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 20,
                    fontWeight: const FontWeight(600),
                    color: AppColors.darkNavyText,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteCards,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(600),
                                color: AppColors.darkNavyText,
                              ),
                            ),
                            Text(
                              "Alex Morgan",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(500),
                                color: AppColors.mutedText,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.edit_outlined,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(600),
                                color: AppColors.darkNavyText,
                              ),
                            ),
                            Text(
                              "alex@gmail.com",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(500),
                                color: AppColors.mutedText,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.edit_outlined,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Text(
                  "Preference",
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 20,
                    fontWeight: const FontWeight(600),
                    color: AppColors.darkNavyText,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteCards,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task reminders",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(600),
                                color: AppColors.darkNavyText,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomToggle(
                          value: remindMe,
                          onChanged: (value) {
                            setState(() {
                              remindMe = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule_outlined,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Default reminder time",
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 16,
                                fontWeight: const FontWeight(600),
                                color: AppColors.darkNavyText,
                              ),
                            ),
                            Text(
                              formatDateTimeIntoTime(DateTime.now()),
                              style: GoogleFonts.googleSansFlex(
                                fontSize: 15,
                                fontWeight: const FontWeight(500),
                                color: AppColors.mutedText,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: AppColors.mutedText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFfefbfc),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  label: Text(
                    "Log out",
                    style: GoogleFonts.googleSansFlex(color: Colors.red),
                  ),
                  icon: const Icon(Icons.logout_outlined, color: Colors.red),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
