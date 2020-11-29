import 'package:calendar_converter/home_screen.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SettingsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Calendar Converter',
        home: HomeScreen(),
      ),
    );
  }
}
