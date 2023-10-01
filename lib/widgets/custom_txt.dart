/*import 'package:app_library/constants/app_style.dart';
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
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFFDCDCDC),
            ),
          ),
        ),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF1A1A1A),
          ),
          child: TextField(
            controller: txtController,
            cursorColor: AppColors.blue,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20, right: 20),
            ),
            cursorOpacityAnimates: true,
            keyboardType: keyboardType,
            maxLines: maxLine,
            scrollPhysics: const BouncingScrollPhysics(),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
        ),
      ],
    );
  }
}*/
