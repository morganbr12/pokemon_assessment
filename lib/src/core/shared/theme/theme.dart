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
          bodySmall: GoogleFonts.sofiaSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      );
}