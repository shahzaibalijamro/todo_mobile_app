import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/utils/date_time_utils.dart';

class ProgressSection extends StatelessWidget {
  final List<Task> taskList;

  const new({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    final completedTasks = getCompletedTasks(taskList).length;
    final totalTasks = taskList.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: GoogleFonts.googleSansFlex(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: AppColors.darkNavyText,
          ),
        ),
        Text(
          "$totalTasks tasks · $completedTasks completed",
          style: GoogleFonts.googleSansFlex(
            fontWeight: FontWeight.w500,
            color: AppColors.mutedText,
            fontSize: 17,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.paleLavender,
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
                        fontSize: 18,
                        color: AppColors.darkNavyText,
                      ),
                    ),
                    Text(
                      "$completedTasks of $totalTasks tasks done",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mutedText,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12),
                      value: totalTasks == 0 ? 0 : completedTasks / totalTasks,
                      minHeight: 14,
                      color: AppColors.primaryPurple,
                      backgroundColor: AppColors.secondaryBackgroundColor,
                    ),
                    // progress
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.secondaryBackgroundColor,
                    // backgroundImage: AssetImage("assets/images/image.png"),
                    radius: 32,
                    child: Icon(
                      Icons.check,
                      size: 46,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 5,
                    child: Transform.rotate(
                      angle: 1,
                      child: Container(
                        width: 10,
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: -15,
                    child: Transform.rotate(
                      angle: 0.6,
                      child: Container(
                        width: 18,
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 19,
                    left: -18,

                    child: Transform.rotate(
                      angle: 0.25,
                      child: Container(
                        width: 11,
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
