import 'package:flutter/material.dart';

class ThemeUtils {
  static const double defaultPadding = 8.0;

  static const Color color1 = Color.fromARGB(255, 76, 95, 215);
  static const Color color2 = Color.fromARGB(255, 114, 50, 189);
  static const Color color3 = Color.fromARGB(255, 255, 220, 125);
  static const Color color4 = Color.fromARGB(255, 244, 111, 48);
  static const Color color5 = Color.fromARGB(255, 215, 58, 73);
  static const Color illuminating = Color.fromARGB(255, 245, 223, 77);
  static const Color ultimateGrey = Color.fromARGB(255, 147, 149, 151);

  static const Color primaryColor = color3;
  static const Color titleColor = Colors.white;
  static const Color ScaffoldBackground = Colors.white;

  static final TextStyle cardBodyTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final gradient1 = LinearGradient(
    colors: [
      Colors.white,
      primaryColor,
    ].toList(),
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final textInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white,
        width: 2,
      )
      //borderSide: BorderSide(width: 2, color: AppTheme.color4),
      );

  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primaryColor),
    scaffoldBackgroundColor: ScaffoldBackground,
  );
}
