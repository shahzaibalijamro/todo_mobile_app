import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/date_time_utils.dart';

class TaskDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const new({super.key, required this.onDateSelected});

  @override
  State<TaskDatePicker> createState() => _TaskDatePickerState();
}

class _TaskDatePickerState extends State<TaskDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });

      widget.onDateSelected(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickDate,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(CustomColors.whiteCards),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              size: 20,
              color: Color(CustomColors.mutedText),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 11,
                    fontWeight: const FontWeight(500),
                    color: const Color(CustomColors.mutedText),
                  ),
                ),
                Text(
                  formatDateForDatePicker(selectedDate),
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 14,
                    fontWeight: const FontWeight(500),
                    color: const Color(CustomColors.darkNavyText),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Color(CustomColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }
}
