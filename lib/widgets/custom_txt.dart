import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.maxLine,
    required this.txtController,
    required this.icon,
    required this.keyboardType,
  });

  final String hintText;
  final int maxLine;
  final TextEditingController txtController;
  final IconData icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyle.title,
      controller: txtController,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: AppStyle.txtField,
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
        prefixIcon: Icon(
          icon,
          size: 18,
        ),
        prefixIconColor: AppStyle.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppStyle.primaryColor,
        ),
        contentPadding: const EdgeInsets.all(12),
      ),
      keyboardType: keyboardType,
      maxLines: maxLine,
    );
  }
}
