import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  DateTime _date = DateTime.now();
  //DateTime _date = new DateTime(1582, 10, 15);

  DateTime get date {
    return _date;
  }

  set date(DateTime date) {
    _date = date;
    notifyListeners();
  }
}
