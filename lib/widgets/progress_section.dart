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
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: GoogleFonts.googleSansFlex(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: const Color(CustomColors.darkNavyText),
            ),
          ),
          Text(
            "$totalTasks tasks · $completedTasks completed",
            style: GoogleFonts.googleSansFlex(
              fontWeight: FontWeight.w500,
              color: const Color(CustomColors.mutedText),
              fontSize: 18,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
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
                          color: const Color(CustomColors.darkNavyText),
                        ),
                      ),
                      Text(
                        "$completedTasks of $totalTasks tasks done",
                        style: GoogleFonts.googleSansFlex(
                          fontWeight: FontWeight.w500,
                          color: const Color(CustomColors.mutedText),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(12),
                          value: completedTasks / totalTasks,
                          minHeight: 14,
                          color: const Color(CustomColors.primaryPurple),
                          backgroundColor: const Color(
                            CustomColors.secondaryBackgroundColor,
                          ),
                        ),
                      ),
                      // progress
                    ],
                  ),
                ),
                const CircleAvatar(
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
}
