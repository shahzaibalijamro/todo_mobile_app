import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/category_selector.dart';
import 'package:todo_app/widgets/custom_toggle.dart';
import 'package:todo_app/widgets/date_picker.dart';
import 'package:todo_app/widgets/text_field.dart';
import 'package:todo_app/widgets/time_picker.dart';

class AddTaskSheet extends StatefulWidget {
  final Function(Task) onCreateTask;

  const AddTaskSheet({super.key, required this.onCreateTask});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final taskController = TextEditingController();
  final notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool remindMe = true;

  Category selectedCategory = Category.work;

  @override
  void dispose() {
    taskController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom + 10;
    void createTask() {
      if (taskController.text == "") {
        return;
      }

      widget.onCreateTask(
        Task(
          name: taskController.text,
          day: selectedDate,
          time: selectedTime,
          reminder: remindMe,
          category: selectedCategory,
        ),
      );

      Navigator.pop(context);
    }

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(CustomColors.backgroundColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(CustomColors.dragHandleColor),
                borderRadius: BorderRadius.circular(14),
              ),
              margin: const EdgeInsets.only(bottom: 5),
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
                  icon: const Icon(
                    Icons.close,
                    color: Color(CustomColors.mutedText),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Task name",
                  style: GoogleFonts.googleSansFlex(
                    color: const Color(CustomColors.darkNavyText),
                    fontWeight: const FontWeight(700),
                    fontSize: 14,
                  ),
                ),
                CustomTextField(
                  controller: taskController,
                  hint: "What do you need to do?",
                  autoFocused: true,
                  minLines: 1,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  "Notes (optional)",
                  style: GoogleFonts.googleSansFlex(
                    color: const Color(CustomColors.darkNavyText),
                    fontWeight: const FontWeight(700),
                    fontSize: 14,
                  ),
                ),
                CustomTextField(
                  controller: notesController,
                  hint: "Add a few details...",
                  autoFocused: false,
                  minLines: 3,
                  maxLines: 3,
                ),
                const SizedBox(height: 7),
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
            CategorySelector(
              selectedCategory: selectedCategory,
              onTap: (selectedCategory) {
                setState(() {
                  this.selectedCategory = selectedCategory;
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Color(CustomColors.mutedText),
                ),
                const SizedBox(width: 10),
                Text(
                  "Remind me",
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 14,
                    fontWeight: const FontWeight(500),
                    color: const Color(CustomColors.darkNavyText),
                  ),
                ),
                const Spacer(),
                CustomToggle(
                  value: remindMe,
                  onChanged: (value) {
                    setState(() {
                      remindMe = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: createTask,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(CustomColors.primaryPurple),
                ),
                width: double.infinity,
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 20,
                      color: Color(CustomColors.whiteCards),
                    ),
                    Text(
                      "Create Task",
                      style: GoogleFonts.googleSansFlex(
                        fontSize: 16,
                        fontWeight: const FontWeight(500),
                        color: const Color(CustomColors.whiteCards),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
