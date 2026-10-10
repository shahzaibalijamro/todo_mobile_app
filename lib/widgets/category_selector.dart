import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/category_pill.dart';

class CategorySelector extends StatelessWidget {
  final Category selectedCategory;
  final Function(Category selectedCategory) onTap;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onTap,
  });

  void selectCategory(Category category) {
    onTap(category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            "Category",
            style: GoogleFonts.googleSansFlex(
              color: AppColors.darkNavyText,
              fontWeight: const FontWeight(700),
            ),
          ),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: [
              InkWell(
                onTap: () => selectCategory(Category.work),
                child: Container(
                  decoration: BoxDecoration(
                    color: getCategoryColor(Category.work)[0],
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(
                      color: getCategoryColor(Category.work)[1],
                      width: Category.work == selectedCategory ? 1 : 0,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        //category indicator
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: getCategoryColor(Category.work)[1],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Text(
                          "Work",
                          style: GoogleFonts.googleSansFlex(
                            color: AppColors.darkNavyText,
                            fontWeight: const FontWeight(500),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () => selectCategory(Category.personal),
                child: Container(
                  decoration: BoxDecoration(
                    color: getCategoryColor(Category.personal)[0],
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(
                      color: getCategoryColor(Category.personal)[1],
                      width: Category.personal == selectedCategory ? 1 : 0,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        //category indicator
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: getCategoryColor(Category.personal)[1],

                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Text(
                          "Personal",
                          style: GoogleFonts.googleSansFlex(
                            color: AppColors.darkNavyText,
                            fontWeight: const FontWeight(500),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () => selectCategory(Category.health),

                child: Container(
                  decoration: BoxDecoration(
                    color: getCategoryColor(Category.health)[0],
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(
                      color: getCategoryColor(Category.health)[1],
                      width: Category.health == selectedCategory ? 1 : 0,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        //category indicator
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: getCategoryColor(Category.health)[1],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Text(
                          "Health",
                          style: GoogleFonts.googleSansFlex(
                            color: AppColors.darkNavyText,
                            fontWeight: const FontWeight(500),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: () => selectCategory(Category.learning),

                child: Container(
                  decoration: BoxDecoration(
                    color: getCategoryColor(Category.learning)[0],
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(
                      color: getCategoryColor(Category.learning)[1],
                      width: Category.learning == selectedCategory ? 1 : 0,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        //category indicator
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: getCategoryColor(Category.learning)[1],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Text(
                          "Learning",
                          style: GoogleFonts.googleSansFlex(
                            color: AppColors.darkNavyText,
                            fontWeight: const FontWeight(500),
                            fontSize: 12,
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
      ),
    );
  }
}
