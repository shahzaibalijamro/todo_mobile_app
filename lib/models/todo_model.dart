class Todo {
  String title;
  String? description;
  DateTime? dateTime = DateTime.now();

  Todo({required this.title, this.description, this.dateTime});
}
