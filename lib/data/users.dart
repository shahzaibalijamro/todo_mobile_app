import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

final List<User> users = [
  User(name: 'Shahzaib', email: 'shahzaib@gmail.com', password: '12345')
    ..userTasks.addAll([
      Task(
        name: 'Plan the week',
        day: DateTime.now(),
        time: const TimeOfDay(hour: 9, minute: 0),
        reminder: true,
        category: Category.personal,
      ),
    ]),
];
