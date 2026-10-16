import 'dart:convert';

class User {
  String name;
  String email;
  String password;

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
