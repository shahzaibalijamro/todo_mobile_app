import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

Widget todoAppBar() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning, Alex",
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w700,
                fontSize: 27,
              ),
            ),
            Text(
              "Wednesday, October 1",
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w500,
                color: Color(CustomColors.mutedText),
                fontSize: 18,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color(CustomColors.paleLavender),
          // backgroundImage: AssetImage("assets/images/image.png"),
          radius: 32,
          child: Icon(
            Icons.person,
            size: 46,
            color: Color(CustomColors.primaryPurple),
          ),
        ),
      ],
    ),
  );
}
