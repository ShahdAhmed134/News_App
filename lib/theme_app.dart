
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
          )
      ),

      textTheme: TextTheme(
          titleLarge: GoogleFonts.exo(
              color: AppColors.whiteColor,
              fontSize: 22,
              fontWeight: FontWeight.bold
          )
      )
  );
}