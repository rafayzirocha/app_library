import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle title = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    color: const Color(0xFF3C3C3C),
  );

  static TextStyle subtitle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFA9A9A9),
  );

  static TextStyle textPrimary = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    color: AppStyle.primaryColor,
  );

  static Color primaryColor = const Color(0xFF0066FF);
  static Color txtColor = const Color(0xFF3C3C3C);
  static Color subtitleColor = const Color(0xFFA9A9A9);
}

class AppColors {
  static Color blue = const Color(0xFF1254FF);
  static Color lightBlue = const Color(0xFFE5EFFF);
  static Color background = const Color(0xFFF5F5F5);
  static Color title = const Color(0xFF212121);
  static Color subtitle = const Color(0xFF757575);
}
