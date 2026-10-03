import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';

List<int> getCategoryColor(Category category) {
  switch (category) {
    case Category.health:
      return [
        CustomColors.healthBackgroundColor,
        CustomColors.healthIndicatorColor,
      ];
    case Category.learning:
      return [
        CustomColors.learningBackgroundColor,
        CustomColors.learningIndicatorColor,
      ];
    case Category.personal:
      return [
        CustomColors.personalBackgroundColor,
        CustomColors.personalIndicatorColor,
      ];
    default:
      return [
        CustomColors.workBackgroundColor,
        CustomColors.workIndicatorColor,
      ];
  }
}

Widget categoryPill(Category category) {
  Color backgroundColor = Color(getCategoryColor(category)[0]);
  Color indicatorColor = Color(getCategoryColor(category)[1]);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      spacing: 7,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: indicatorColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Text(
          category.name,
          style: GoogleFonts.googleSansFlex(
            color: Color(CustomColors.darkNavyText),
          ),
        ),
      ],
    ),
  );
}
