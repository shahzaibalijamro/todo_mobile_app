import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/category_pill.dart';

class CategorySelector extends StatelessWidget {
  final Category selectedCategory;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: GoogleFonts.googleSansFlex(
            color: Color(CustomColors.darkNavyText),
            fontWeight: FontWeight(700),
          ),
        ),
        Row(
          spacing: 7,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(getCategoryColor(Category.work)[0]),
                  borderRadius: BorderRadius.circular(15),
                  border: BoxBorder.all(
                    color: Color(getCategoryColor(Category.work)[1]),
                    width: Category.work == selectedCategory ? 1 : 0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Row(
                    spacing: 7,
                    children: [
                      //category indicator
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(getCategoryColor(Category.work)[1]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        "Work",
                        style: GoogleFonts.googleSansFlex(
                          color: Color(CustomColors.darkNavyText),
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(getCategoryColor(Category.personal)[0]),
                  borderRadius: BorderRadius.circular(15),
                  border: BoxBorder.all(
                    color: Color(getCategoryColor(Category.personal)[1]),
                    width: Category.personal == selectedCategory ? 1 : 0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Row(
                    spacing: 7,
                    children: [
                      //category indicator
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(getCategoryColor(Category.personal)[1]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        "Personal",
                        style: GoogleFonts.googleSansFlex(
                          color: Color(CustomColors.darkNavyText),
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(getCategoryColor(Category.health)[0]),
                  borderRadius: BorderRadius.circular(15),
                  border: BoxBorder.all(
                    color: Color(getCategoryColor(Category.health)[1]),
                    width: Category.health == selectedCategory ? 1 : 0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Row(
                    spacing: 7,
                    children: [
                      //category indicator
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(getCategoryColor(Category.health)[1]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        "Health",
                        style: GoogleFonts.googleSansFlex(
                          color: Color(CustomColors.darkNavyText),
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(getCategoryColor(Category.learning)[0]),
                  borderRadius: BorderRadius.circular(15),
                  border: BoxBorder.all(
                    color: Color(getCategoryColor(Category.learning)[1]),
                    width: Category.learning == selectedCategory ? 1 : 0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Row(
                    spacing: 7,
                    children: [
                      //category indicator
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(getCategoryColor(Category.learning)[1]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        "Learning",
                        style: GoogleFonts.googleSansFlex(
                          color: Color(CustomColors.darkNavyText),
                          fontWeight: FontWeight(500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
