import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

Widget progressSection() {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: GoogleFonts.googleSansFlex(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        Text(
          "12 tasks · 4 completed",
          style: GoogleFonts.googleSansFlex(
            fontWeight: FontWeight.w500,
            color: Color(CustomColors.mutedText),
            fontSize: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(CustomColors.paleLavender),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Daily progress",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "4 of 12 tasks done",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w500,
                        color: Color(CustomColors.mutedText),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(12),
                        value: 4 / 12,
                        minHeight: 14,
                        color: Color(CustomColors.primaryPurple),
                        backgroundColor: Color(
                          CustomColors.secondaryBackgroundColor,
                        ),
                      ),
                    ),
                    // progress
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(CustomColors.secondaryBackgroundColor),
                // backgroundImage: AssetImage("assets/images/image.png"),
                radius: 32,
                child: Icon(
                  Icons.check,
                  size: 46,
                  color: Color(CustomColors.primaryPurple),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
