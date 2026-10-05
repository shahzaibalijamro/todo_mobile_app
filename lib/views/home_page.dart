import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/bottom_add_task_sheet.dart';
import 'package:todo_app/widgets/tasks_section.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/progress_section.dart';

class TaskScreen extends StatefulWidget {
  final String username;
  const new({super.key, required this.username});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> taskList = [];

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void openModalSheet() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) {
          return AddTaskSheet(
            onCreateTask: (Task newTask) {
              setState(() {
                taskList.add(newTask);
              });
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(CustomColors.backgroundColor),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModalSheet();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(widget.username),
            ProgressSection(taskList: taskList),
            tasksSection(updateState, taskList: taskList),
          ],
        ),
      ),
    );
  }
}
