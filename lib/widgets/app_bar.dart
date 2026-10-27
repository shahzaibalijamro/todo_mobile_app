import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/date_time_utils.dart';
import 'package:todo_app/views/layout_page.dart';

class MyAppBar extends StatefulWidget {
  final String? username;
  final Screen? page;
  const new({super.key, this.username, this.page});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.page) {
      case Screen.profile:
        return SafeArea(
          child: Container(
            padding: const EdgeInsetsGeometry.symmetric(vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w700,
                        fontSize: 27,
                        color: AppColors.darkNavyText,
                      ),
                    ),
                    Text(
                      "Make this space yours.",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mutedText,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case Screen.calendar:
        return SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Calendar",
                        style: GoogleFonts.googleSansFlex(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          color: AppColors.darkNavyText,
                        ),
                      ),
                      Text(
                        "Plan your day, one task at a time.",
                        style: GoogleFonts.googleSansFlex(
                          fontWeight: FontWeight.w600,
                          color: AppColors.mutedText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.paleLavender,
                  // backgroundImage: AssetImage("assets/images/image.png"),
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    size: 38,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good ${isMorningOrAfterNoon()}, $widget.username",
                        maxLines: 2,
                        style: GoogleFonts.googleSansFlex(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: AppColors.darkNavyText,
                        ),
                      ),
                      Text(
                        getCurrentDay(),
                        style: GoogleFonts.googleSansFlex(
                          fontWeight: FontWeight.w500,
                          color: AppColors.mutedText,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.paleLavender,
                  // backgroundImage: AssetImage("assets/images/image.png"),
                  radius: 32,
                  child: Icon(
                    Icons.person,
                    size: 46,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
