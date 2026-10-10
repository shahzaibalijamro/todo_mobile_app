import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final int minLines;
  final int maxLines;
  final bool autoFocused;
  final bool isPassword;
  final IconData? prefixIcon;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    this.autoFocused = false,
    this.isPassword = false,
    this.prefixIcon,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
  }

  Widget? getPasswordIcon() {
    if (widget.isPassword) {
      if (isObscured) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              setState(() {
                isObscured = !isObscured;
              });
            },
            icon: const Icon(
              Icons.visibility_off_outlined,
              color: AppColors.mutedText,
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              setState(() {
                isObscured = !isObscured;
              });
            },
            icon: const Icon(
              Icons.visibility_outlined,
              color: AppColors.mutedText,
            ),
          ),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: TextField(
        focusNode: widget.focusNode,
        obscureText: isObscured,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        cursorColor: AppColors.mutedText,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 14,
        autofocus: widget.autoFocused,
        style: GoogleFonts.googleSansFlex(
          color: AppColors.darkNavyText,
          fontSize: 14,
          fontWeight: const FontWeight(500),
        ),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Icon(widget.prefixIcon, color: AppColors.mutedText),
                )
              : null,
          suffixIcon: getPasswordIcon(),
          // contentPadding: const EdgeInsets.only(left: 20),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.dragHandleColor,
              width: 0.5,
            ),
          ),
          fillColor: AppColors.whiteCards,
          hintText: widget.hint,
          hintStyle: GoogleFonts.googleSansFlex(
            color: AppColors.mutedText,
            fontSize: 13,
            fontWeight: const FontWeight(500),
          ),
        ),
      ),
    );
  }
}
