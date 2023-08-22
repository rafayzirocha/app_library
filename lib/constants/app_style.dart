import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle title = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    color: const Color(0xFF3C3C3C),
  );

  static TextStyle txtField = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    color: const Color(0xFFA9A9A9),
  );

  static TextStyle txtSnackBar = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    color: Colors.white,
  );

  static TextStyle subtitle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFA9A9A9),
  );

  static TextStyle subtitleBlue = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF0066FF),
  );

  static Color primaryColor = const Color(0xFF0066FF);
  static Color txtColor = const Color(0xFF3C3C3C);
}
