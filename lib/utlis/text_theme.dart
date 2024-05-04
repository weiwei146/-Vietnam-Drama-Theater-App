import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TheaterTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      titleMedium: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 20,
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 15,
      ));
  static TextTheme darkTextTheme = TextTheme(
      titleMedium: GoogleFonts.poppins(
        color: Colors.white70,
        fontSize: 20,
      ),
      titleSmall: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 15,
      ));
}
