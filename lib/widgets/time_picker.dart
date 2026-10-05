import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class TaskTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;
  const new({super.key, required this.onTimeSelected});

  @override
  State<TaskTimePicker> createState() => _TaskTimePickerState();
}

class _TaskTimePickerState extends State<TaskTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });

      widget.onTimeSelected(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickTime,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(CustomColors.whiteCards),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.access_time,
              size: 20,
              color: Color(CustomColors.mutedText),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  style: GoogleFonts.googleSansFlex(
                    fontSize: 11,
                    fontWeight: const FontWeight(500),
                    color: const Color(CustomColors.mutedText),
                  ),
                ),
                Text(
                  selectedTime.format(context),
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
