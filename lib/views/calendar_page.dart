import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/views/layout_page.dart';
import 'package:todo_app/widgets/app_bar.dart';

class CalendarScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Widget weekSection() {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteCards,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "October 2026",
                style: GoogleFonts.googleSansFlex(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: AppColors.darkNavyText,
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.paleLavender,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryPurple,
                        size: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.paleLavender,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryPurple,
                        size: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyAppBar(page: Screen.calendar),
        weekSection(),
      ],
    );
  }
}
