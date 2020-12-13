import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'caledar_item_widget.dart';

class JulianDayCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  int _julianDay;
  _compute() {
    int a = (_date.year / 100).floor();
    int b = (a / 4).floor();
    int c = 2 - a + b;
    int e = (365.25 * (_date.year + 4716)).floor();
    int f = (30.6001 * (_date.month + 1)).floor();
    _julianDay = (c + _date.day + e + f - 1524.5).floor();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    _date = dataProvider.date;
    _compute();

    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$_julianDay",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );

    return CalendarItem(
      titleText: 'Julian day',
      imageAsset: 'assets/images/maya.png',
      body: body,
    );
  }
}
