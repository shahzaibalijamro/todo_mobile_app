import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/widgets/bottom_add_task_sheet.dart';
import 'package:todo_app/widgets/bottom_edit_task_sheet.dart';
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
  List<Task> taskList = [];
  bool isLoading = true;

  void updateState() {
    setState(() {});
  }

  void updateTasksInMemory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      "${widget.user.email}Todos",
      taskList.map((e) {
        return e.toJSON();
      }).toList(),
    );
  }

  void getTasksSavedInMemory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasksInMemory =
        prefs.getStringList("${widget.user.email}Todos") ?? [];
    final List<Task> tasks = tasksInMemory
        .map((e) => Task.fromJSON(e))
        .toList();
    setState(() {
      taskList = tasks;
      isLoading = false;
    });
  }

  void addNewTask(Task newTask) {
    setState(() {
      taskList.add(newTask);
    });
    updateTasksInMemory();
  }

  void editTask(Task newTask, int index) {
    setState(() {
      taskList[index] = newTask;
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
    void openModalSheet({bool forEdit = false, Task? currentTask, int? index}) {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) {
          return forEdit
              ? EditTaskSheet(
                  onEditTask: editTask,
                  currentTask: currentTask!,
                  index: index!,
                )
              : AddTaskSheet(onCreateTask: addNewTask);
        },
      );
    }

    if (isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     openModalSheet();
      //   },
      //   child: const Icon(Icons.add),
      // ),
      body: SafeArea(
        child: ListView(
          children: [
            customAppBar(username: widget.user.name),
            ProgressSection(taskList: taskList),
            TasksSection(
              openModalSheet: openModalSheet,
              updateState: updateState,
              taskList: taskList,
            ),
          ],
        ),
      ),
    );
  }
}
