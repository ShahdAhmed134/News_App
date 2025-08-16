
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme:IconThemeData(
          color: AppColors.whiteColor,
        ),
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
          ),
        titleMedium: GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),
        titleSmall: GoogleFonts.poppins(
            color: AppColors.grayColor,
            fontSize: 11,
            fontWeight: FontWeight.w400
        ),
        labelLarge:
        GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      )
  );
}