import 'dart:convert';

import 'package:todo_app/utils/enum_utils.dart';

enum Category { work, health, personal, learning }

class Task {
  String name;
  String? notes;
  DateTime day;
  bool reminder;
  Category category;
  bool isCompleted = false;

  Task({
    required this.name,
    this.notes,
    required this.day,
    required this.reminder,
    required this.category,
    bool? isCompleted,
  }) : isCompleted = isCompleted ?? false;

  String toJSON() {
    return jsonEncode({
      "name": name,
      "notes": notes,
      "day": day.toString(),
      "reminder": reminder,
      "category": category.toString(),
      "isCompleted": isCompleted,
    });
  }

  factory Task.fromJSON(String taskString) {
    final Map<String, dynamic> taskInMap = jsonDecode(taskString);
    return Task(
      name: taskInMap["name"],
      notes: taskInMap["notes"],
      day: DateTime.parse(taskInMap["day"]),
      reminder: taskInMap["reminder"],
      category: getCategory(category: taskInMap["category"]),
      isCompleted: taskInMap["isCompleted"],
    );
  }
}
