import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_converter/bloc/date_bloc.dart';
import 'package:calendar_converter/screens/home/home_screen.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'obs.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
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
        theme: ThemeUtils.theme,
        title: 'Calendar Converter',
        home: BlocProvider(
          create: (context) => DateBloc(),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
