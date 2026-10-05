import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/task_tiles.dart';

Widget tasksSection(
  void Function() updateState, {
  required List<Task> taskList,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Tasks",
                style: GoogleFonts.googleSansFlex(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: const Color(CustomColors.darkNavyText),
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
                        fontWeight: FontWeight.w500,
                        color: const Color(CustomColors.primaryPurple),
                        fontSize: 15,
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(CustomColors.primaryPurple),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (taskList.length > 0) ...[
            Expanded(
              flex: 3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                itemBuilder: (context, index) {
                  Task currentTask = taskList[index];
                  return taskTile(updateState, currentTask, context);
                },
                itemCount: taskList.length,
              ),
            ),
          ] else ...[
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  "No Tasks currently!",
                  style: GoogleFonts.googleSansFlex(
                    color: const Color(CustomColors.mutedText),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
