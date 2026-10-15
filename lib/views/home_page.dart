import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  void updateTasksInMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      "${widget.user.email}Todos",
      widget.user.userTasks.map((e) {
        return e.toJSON();
      }).toList(),
    );
  }

  void getTasksSavedInMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksInMemory =
        prefs.getStringList("${widget.user.email}Todos") ?? [];
    List<Task> tasks = tasksInMemory.map((e) => Task.fromJSON(e)).toList();
    widget.user.userTasks.addAll(tasks);
    setState(() {});
  }

  void addNewTask(Task newTask) {
    setState(() {
      widget.user.userTasks.add(newTask);
    });
    updateTasksInMemory();
  }

  @override
  void initState() {
    super.initState();
    getTasksSavedInMemory();
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
          return AddTaskSheet(onCreateTask: addNewTask);
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
