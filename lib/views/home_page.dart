import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/bottom_add_task_sheet.dart';
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
      category: Category.work,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
    Task(
      name: "Third Todo",
      category: Category.personal,
      day: DateTime(2006),
      reminder: true,
      time: DateTime.now(),
    ),
    Task(
      name: "Fourth Todo",
      category: Category.learning,
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

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void addTodo() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isDismissible: false,
        builder: (context) {
          return addTaskSheet(context);
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
            customAppBar(),
            progressSection(),
            tasksSection(updateState, taskList: taskList),
          ],
        ),
      ),
    );
  }
}
