import 'package:todo_app/models/task_model.dart';

class User {
  String name;
  String email;
  String password;
  final List<Task> userTasks = [];

  User({required this.name, required this.email, required this.password});
}
