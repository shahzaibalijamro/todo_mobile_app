import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/task_tiles.dart';

Widget tasksSection({required List<Task> taskList}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
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
                ),
              ),
              Row(
                spacing: 4,
                children: [
                  TextButton.icon(
                    iconAlignment: IconAlignment.end,
                    onPressed: () {},
                    label: Text(
                      "See all",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w500,
                        color: Color(CustomColors.primaryPurple),
                        fontSize: 15,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(CustomColors.primaryPurple),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                Task currentTask = taskList[index];
                return taskTile(currentTask);
              },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    ),
  );
}
