import 'package:flutter/material.dart';

class ThemeUtils {
  static const Color color1 = Color.fromARGB(255, 76, 95, 215);
  static const Color color2 = Color.fromARGB(255, 114, 50, 189);
  static const Color color3 = Color.fromARGB(255, 255, 220, 125);
  static const Color color4 = Color.fromARGB(255, 244, 111, 48);
  static const Color color5 = Color.fromARGB(255, 215, 58, 73);

  static final TextStyle CalendarTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static final gradient1 = LinearGradient(
    colors: [
      color2,
      color2,
      color1,
    ].toList(),
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final textInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.black54,
        width: 2,
      )
      //borderSide: BorderSide(width: 2, color: AppTheme.color4),
      );
}
