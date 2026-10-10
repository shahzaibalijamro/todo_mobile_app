import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/widgets/bottom_add_task_sheet.dart';
import 'package:todo_app/widgets/tasks_section.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/progress_section.dart';

class TaskScreen extends StatefulWidget {
  final User user;
  const new({super.key, required this.user});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> get taskList => widget.user.userTasks;

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
                widget.user.userTasks.add(newTask);
              });
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModalSheet();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            customAppBar(username: widget.user.name),
            ProgressSection(taskList: taskList),
            tasksSection(updateState, taskList: taskList),
          ],
        ),
      ),
    );
  }
}
