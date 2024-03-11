import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors.dart';

class AppThemeData {
  static theme() =>
      ThemeData().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.kWhiteColor,
          elevation: 1,
        ),
        textTheme: GoogleFonts.sofiaSansTextTheme().copyWith(
          titleLarge: GoogleFonts.sofiaSans(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: AppColors.kPrimaryColor,
          ),
          titleMedium: GoogleFonts.sofiaSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.kPrimaryColor,
          ),
          titleSmall: GoogleFonts.sofiaSans(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.kPrimaryColor,
          ),
          bodySmall: GoogleFonts.sofiaSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.sofiaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.kPrimaryColor,
          ),
        ),
      );
}