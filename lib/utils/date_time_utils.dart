import 'package:intl/intl.dart';
import 'package:todo_app/models/task_model.dart';

String formatDateTimeIntoTime(DateTime dateTime) {
  return DateFormat('h:mm a').format(dateTime);
}

String getCurrentDay() {
  DateTime rightNow = DateTime.now();
  return DateFormat('EEEE, MMMM d').format(rightNow);
}

String formatDateForDatePicker(DateTime dateTime) {
  DateTime rightNow = DateTime.now();
  if (dateTime.day == rightNow.day) {
    return "Today";
  }
  if (dateTime.day == rightNow.day + 1) {
    return "Tomorrow";
  }
  return DateFormat("dd/MM/yyyy").format(dateTime);
}

List<Task> getCompletedTasks(List<Task> taskList) {
  return taskList.where((element) => element.isCompleted).toList();
}

String isMorningOrAfterNoon() {
  DateTime rightNow = DateTime.now();
  final period = DateFormat('a').format(rightNow);
  return period == "AM" ? "Morning" : "Evening";
}
