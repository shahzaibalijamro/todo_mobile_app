import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';

List<Color> getCategoryColor(Category category) {
  switch (category) {
    case Category.health:
      return [AppColors.healthBackgroundColor, AppColors.healthIndicatorColor];
    case Category.learning:
      return [
        AppColors.learningBackgroundColor,
        AppColors.learningIndicatorColor,
      ];
    case Category.personal:
      return [
        AppColors.personalBackgroundColor,
        AppColors.personalIndicatorColor,
      ];
    default:
      return [AppColors.workBackgroundColor, AppColors.workIndicatorColor];
  }
}

Widget categoryPill(Category category) {
  Color backgroundColor = getCategoryColor(category)[0];
  Color indicatorColor = getCategoryColor(category)[1];
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
          style: GoogleFonts.googleSansFlex(color: AppColors.darkNavyText),
        ),
      ],
    ),
  );
}
