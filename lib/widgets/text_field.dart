import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int minLines;
  final int maxLines;
  final bool autoFocused;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    this.autoFocused = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        cursorColor: const Color(CustomColors.mutedText),
        textAlignVertical: TextAlignVertical.top,
        cursorHeight: 14,
        autofocus: autoFocused,
        style: GoogleFonts.googleSansFlex(
          color: const Color(CustomColors.darkNavyText),
          fontSize: 14,
          fontWeight: const FontWeight(500),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: minLines == 1 ? 0 : 12,
          ),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(CustomColors.dragHandleColor),
              width: 0.5,
            ),
          ),
          fillColor: const Color(CustomColors.whiteCards),
          hintText: hint,
          hintStyle: GoogleFonts.googleSansFlex(
            color: const Color(CustomColors.mutedText),
            fontSize: 13,
            fontWeight: const FontWeight(500),
          ),
        ),
        validator: (value) {
          if (value == "") {
            return "Task name is required";
          }
          return null;
        },
      ),
    );
  }
}
