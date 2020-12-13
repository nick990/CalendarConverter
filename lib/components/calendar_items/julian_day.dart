import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JulianDayCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  int _julianDay;

  final bool imageOnLeft;

  JulianDayCalendarItemWidget({Key key, this.imageOnLeft = true})
      : super(key: key);

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
          style: ThemeUtils.cardBodyTextStyle,
        ),
      ],
    );

    return CalendarItem(
      titleText: 'Julian day',
      imageAsset: 'assets/images/maya.png',
      body: body,
      imageOnLeft: imageOnLeft,
    );
  }
}
