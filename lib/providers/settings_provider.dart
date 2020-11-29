import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  List<String> _formatList = [
    "dd-MM-yyyy",
    "yyyy-MM-dd",
    "MM-dd-yyyy",
  ];

  List<String> get availableFormats {
    return _formatList;
  }

  String _format = "dd-MM-yyyy G";
  DateTime _date = DateTime.now();

  String get format {
    return _format;
  }

  set format(String newValue) {
    _format = newValue;
    notifyListeners();
  }

  DateTime get date {
    return _date;
  }

  set date(DateTime date) {
    _date = date;
    notifyListeners();
  }
}
