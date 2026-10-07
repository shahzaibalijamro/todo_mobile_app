import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/category_pill.dart';

Widget taskTile(
  void Function() updateState,
  Task currentTask,
  BuildContext context,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(CustomColors.whiteCards),
    ),
    padding: const EdgeInsetsGeometry.all(15),
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Color(
              currentTask.isCompleted ? CustomColors.primaryPurple : 0xFFFFFFFF,
            ),
            border: BoxBorder.all(
              width: currentTask.isCompleted ? 0 : 1,
              color: const Color(CustomColors.mutedText),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            iconSize: 20,
            onPressed: () {
              currentTask.isCompleted = !currentTask.isCompleted;
              updateState();
            },
            icon: const Icon(Icons.check, color: Colors.white),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                currentTask.name,
                style: GoogleFonts.googleSansFlex(
                  fontSize: 16,
                  fontWeight: const FontWeight(600),
                  color: Color(
                    currentTask.isCompleted
                        ? CustomColors.mutedText
                        : CustomColors.darkNavyText,
                  ),
                  decoration: currentTask.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 16,
                    color: Color(CustomColors.mutedText),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    currentTask.time.format(context),
                    style: GoogleFonts.googleSansFlex(
                      color: const Color(CustomColors.mutedText),
                    ),
                  ),
                  const SizedBox(width: 18),
                  categoryPill(currentTask.category),
                ],
              ),
            ],
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   style: TextButton.styleFrom(
        //     padding: EdgeInsets.symmetric(horizontal: 0),

        //   ),
        //   child: Icon(
        //     Icons.more_vert,
        //     color: Color(CustomColors.mutedText),
        //     // size: 25,
        //     fontWeight: FontWeight(500),
        //   ),
        // ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.more_vert,
            color: Color(CustomColors.mutedText),
            size: 25,
            fontWeight: FontWeight(500),
          ),
        ),
      ],
    ),
  );
}
