import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobflixTheme {
  static const Color background = Color(0xFF1A1A1A);
  static Color? primaryColor = Colors.blue[400];
 

  static ThemeData theme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      primaryColor: primaryColor,
      useMaterial3: true,
      colorScheme: const ColorScheme(
          background: Color(0xff3423),
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Colors.white10,
          onError: Colors.white38,
          onPrimary: Colors.blueAccent,
          onSecondary: Colors.red,
          onSurface: Colors.blueGrey,
          primary: Colors.white,
          secondary: Colors.blueAccent,
          surface: Colors.black),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
      ),

      /// textTheme: GoogleFonts.wendyOneTextTheme(ThemeData.dark().textTheme),

      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: background,
          titleTextStyle: GoogleFonts.bebasNeue(
              fontSize: 32, color: primaryColor, fontWeight: FontWeight.w400),
          centerTitle: true));
}
