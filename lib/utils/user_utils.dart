import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/user_model.dart';

Future<User?> findUser({required String email}) async {
  final users = await getSavedUsersInMemory();
  for (var user in users) {
    if (user.email.toLowerCase() == email.toLowerCase()) {
      return user;
    }
  }
  return null;
}

Future<List<User>> getSavedUsersInMemory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> usersInMemory = prefs.getStringList("users") ?? [];
  return usersInMemory.map((i) => User.fromJSON(i)).toList();
}
