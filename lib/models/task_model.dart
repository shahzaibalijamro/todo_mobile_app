enum Category { work, health, personal, learning }

class Task {
  String name;
  String? notes;
  DateTime day;
  DateTime time;
  bool reminder;
  Category category;
  bool isCompleted = false;

  Task({
    required this.name,
    this.notes,
    required this.day,
    required this.time,
    required this.reminder,
    required this.category,
  });
}
