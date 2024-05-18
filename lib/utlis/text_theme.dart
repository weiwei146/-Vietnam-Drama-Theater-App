import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TheaterTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.montserrat(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: GoogleFonts.montserrat(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
    labelMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
}
