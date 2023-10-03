import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle title1 = GoogleFonts.inter(
    color: AppStyle.white,
    fontSize: 20,
  );

  static TextStyle title2 = GoogleFonts.inter(
    color: AppStyle.white,
    fontSize: 16,
  );

  static TextStyle title3 = GoogleFonts.inter(
    color: AppStyle.gray,
    fontSize: 16,
  );

  static TextStyle subtitle = GoogleFonts.inter(
    color: AppStyle.gray,
    fontSize: 14,
  );

  static Color primary = const Color(0xFF5271FE);
  static Color white = const Color(0xFFFFFFFF);
  static Color gray = const Color(0xFFA9A9A9);
  static Color dark1 = const Color(0xFF202020);
  static Color dark2 = const Color(0xFF353535);
}
