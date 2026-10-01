import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';

Widget taskTile(Task currentTask) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    padding: EdgeInsetsGeometry.all(10),
    margin: EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Color(
              currentTask.isCompleted ? CustomColors.primaryPurple : 0xFFFFFFFF,
            ),
            border: BoxBorder.all(
              width: currentTask.isCompleted ? 0 : 1,
              color: Color(CustomColors.mutedText),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.check, color: Colors.white, size: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(currentTask.name),
            Text(currentTask.notes ?? "No notes"),
          ],
        ),
      ],
    ),
  );
}
