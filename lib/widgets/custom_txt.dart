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
            style: AppStyle.title,
          ),
        ),
        const Gap(10),
        TextField(
          style: AppStyle.title,
          controller: txtController,
          cursorColor: AppStyle.primaryColor,
          cursorRadius: const Radius.circular(20),
          decoration: InputDecoration(
            helperText: helperText,
            helperStyle: GoogleFonts.plusJakartaSans(
              color: AppStyle.subtitleColor,
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
