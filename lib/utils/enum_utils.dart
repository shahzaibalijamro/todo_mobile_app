import 'package:todo_app/models/task_model.dart';

Category getCategory({required String category}) {
  switch (category) {
    case "Category.work":
      return Category.work;
    case "Category.health":
      return Category.health;
    case "Category.personal":
      return Category.personal;
    default:
      return Category.learning;
  }
}
