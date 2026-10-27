import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/constants/animations.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/task_tiles.dart';

class TasksSection extends StatefulWidget {
  final Function({bool forEdit, Task? currentTask, int? index}) openModalSheet;
  final Function() updateState;
  final List<Task> taskList;
  const new({
    super.key,
    required this.openModalSheet,
    required this.updateState,
    required this.taskList,
  });

  @override
  State<TasksSection> createState() => _TasksSectionState();
}

class _TasksSectionState extends State<TasksSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Tasks",
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: AppColors.darkNavyText,
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    iconAlignment: IconAlignment.end,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  onPressed: () {},
                  label: Text(
                    "See all",
                    style: GoogleFonts.googleSansFlex(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryPurple,
                      fontSize: 16,
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryPurple,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (widget.taskList.isEmpty) ...[
          const SizedBox(height: 20),
          Center(
            child: Lottie.asset(AppAnimations.nothingAnimation, height: 250),
          ),
          Center(
            child: Text(
              "No tasks yet",
              style: GoogleFonts.googleSansFlex(
                color: AppColors.mutedText,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 50),
        ] else ...[
          ListView.builder(
            // This list is inside the page's main ListView. Let it take only
            // the space its rows need and let the parent handle scrolling.
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            itemBuilder: (context, index) {
              final Task currentTask = widget.taskList[index];
              return taskTile(
                widget.updateState,
                currentTask,
                context,
                widget.openModalSheet,
                index,
              );
            },
            itemCount: widget.taskList.length,
          ),
        ],
      ],
    );
  }
}
