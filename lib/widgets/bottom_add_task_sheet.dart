import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/category_selector.dart';
import 'package:todo_app/widgets/date_picker.dart';
import 'package:todo_app/widgets/text_field.dart';
import 'package:todo_app/widgets/time_picker.dart';

Widget addTaskSheet(BuildContext context) {
  final taskController = TextEditingController();
  final notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Category selectedCategory = Category.work;

  print(selectedTime);

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(CustomColors.backgroundColor),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Column(
      children: [
        Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Color(CustomColors.dragHandleColor),
            borderRadius: BorderRadius.circular(14),
          ),
          margin: EdgeInsets.only(top: 10, bottom: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add task",
              style: GoogleFonts.googleSansFlex(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            IconButton(
              color: Colors.black,
              hoverColor: Colors.black,
              padding: EdgeInsets.zero,
              iconSize: 25,
              tooltip: "Close",
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: Color(CustomColors.mutedText)),
            ),
          ],
        ),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Task name",
              style: GoogleFonts.googleSansFlex(
                color: Color(CustomColors.darkNavyText),
                fontWeight: FontWeight(700),
              ),
            ),
            CustomTextField(
              controller: taskController,
              hint: "What do you need to do?",
              autoFocused: true,
              minLines: 1,
              maxLines: 1,
            ),
            SizedBox(height: 10),
            Text(
              "Notes (optional)",
              style: GoogleFonts.googleSansFlex(
                color: Color(CustomColors.darkNavyText),
                fontWeight: FontWeight(700),
              ),
            ),
            CustomTextField(
              controller: notesController,
              hint: "Add a few details...",
              minLines: 3,
              maxLines: 3,
            ),
            SizedBox(height: 10),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: TaskDatePicker(
                onDateSelected: (date) {
                  selectedDate = date;
                },
              ),
            ),
            Expanded(
              child: TaskTimePicker(
                onTimeSelected: (time) {
                  selectedTime = time;
                },
              ),
            ),
            // TaskTimePicker(),
          ],
        ),
        CategorySelector(selectedCategory: selectedCategory),
      ],
    ),
  );
}
