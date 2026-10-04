import 'package:intl/intl.dart';

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
