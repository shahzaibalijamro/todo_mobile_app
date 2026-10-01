import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/tasks_section.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/progress_section.dart';

class TaskScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> taskList = [
    Task(
      name: "First Todo",
      category: Category.health,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
    Task(
      name: "Second Todo",
      category: Category.health,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
    Task(
      name: "Third Todo",
      category: Category.health,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
    Task(
      name: "Fourth Todo",
      category: Category.health,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void addTodo() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 7),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(CustomColors.paleLavender),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 12,
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Task",
                      style: GoogleFonts.googleSansFlex(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Color(CustomColors.primaryPurple),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(CustomColors.backgroundColor),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            todoAppBar(),
            progressSection(),
            tasksSection(taskList: taskList),
          ],
        ),
      ),
    );
  }
}
