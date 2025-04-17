import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';

var appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: transparent,
    elevation: 0, // Removes shadow for a flat design
    centerTitle: true, // Centers the title
    titleTextStyle: TextStyle(
      color: Colors.white70, // Use black for better contrast
      fontSize: 24, // Slightly larger font size for emphasis
      fontWeight: FontWeight.w600, // Semi-bold for a clean look
      letterSpacing: 1.2, // Adds slight spacing for better readability
    ),
    iconTheme: IconThemeData(
      color: Colors.black, // Ensures icons match the title color
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: color1,
  ),
  scaffoldBackgroundColor: color1,
  textTheme: TextTheme(
    displayLarge: textTheme1,
    displayMedium: textTheme2,
  )
);