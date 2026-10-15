import 'dart:convert';

import 'package:todo_app/models/task_model.dart';

class User {
  String name;
  String email;
  String password;
  final List<Task> userTasks = [];

  User({required this.name, required this.email, required this.password});

  String toJSON() {
    return jsonEncode({"name": name, "email": email, "password": password});
  }

  static User fromJSON(String userInString) {
    Map<String, dynamic> userInMap = jsonDecode(userInString);
    return User(
      name: userInMap["name"],
      email: userInMap["email"],
      password: userInMap["password"],
    );
  }
}
