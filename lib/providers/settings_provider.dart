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

  String get format {
    return _format;
  }

  set format(String newValue) {
    _format = newValue;
    notifyListeners();
  }
}
