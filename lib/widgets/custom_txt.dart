import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.helperText,
    required this.maxLine,
    required this.txtController,
    required this.keyboardType,
  });

  final String title;
  final String? helperText;
  final int maxLine;
  final TextEditingController txtController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
        ),
        const Gap(10),
        TextField(
          style: GoogleFonts.jost(
            fontSize: 16,
            color: const Color(0xFF3C3C3C),
          ),
          controller: txtController,
          cursorColor: AppStyle.primaryColor,
          cursorRadius: const Radius.circular(20),
          decoration: InputDecoration(
            helperText: helperText,
            helperStyle: GoogleFonts.jost(
              color: const Color(0xFFA9A9A9),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFD4D4D4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppStyle.primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          keyboardType: keyboardType,
          maxLines: maxLine,
        ),
      ],
    );
  }
}
