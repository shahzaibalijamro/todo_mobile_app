String formatDateTimeIntoTime(DateTime dateTime) {
  if (dateTime.hour == 12) {
    return "${dateTime.hour}:${dateTime.minute} PM";
  }
  if (dateTime.hour < 12) {
    return "${dateTime.hour}:${dateTime.minute} AM";
  }
  return "${dateTime.hour - 12}:${dateTime.minute} PM";
}

String getCurrentDay() {
  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  List<String> monthsOfYear = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  DateTime rightNow = DateTime.now();
  return "${daysOfWeek[rightNow.weekday - 1]}, ${monthsOfYear[rightNow.weekday - 1]} ${rightNow.day}";
}
