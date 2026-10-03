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
                  color: Color(CustomColors.darkNavyText),
                ),
              ),
              Row(
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      iconAlignment: IconAlignment.end,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    ),
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
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 50),
              itemBuilder: (context, index) {
                Task currentTask = taskList[index];
                return taskTile(updateState, currentTask);
              },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    ),
  );
}
