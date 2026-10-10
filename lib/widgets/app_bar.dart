import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/date_time_utils.dart';
import 'package:todo_app/views/layout_page.dart';

Widget customAppBar({String? username, Screen? page}) {
  if (page == Screen.profile) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 15),
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
    );
  }
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good ${isMorningOrAfterNoon()}, $username",
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w700,
                fontSize: 27,
                color: AppColors.darkNavyText,
              ),
            ),
            Text(
              getCurrentDay(),
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w500,
                color: AppColors.mutedText,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: AppColors.paleLavender,
          // backgroundImage: AssetImage("assets/images/image.png"),
          radius: 32,
          child: Icon(Icons.person, size: 46, color: AppColors.primaryPurple),
        ),
      ],
    ),
  );
}
