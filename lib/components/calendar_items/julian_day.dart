import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/utils/calendar_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JulianDayCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  int _julianDay;

  final bool imageOnLeft;

  JulianDayCalendarItemWidget({Key key, this.imageOnLeft = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    _date = dataProvider.date;
    _julianDay = CalendarUtils.getJulianDayFromDateTime(_date);

    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$_julianDay\n\nDays elapsed since\nJanuary 1 4713 B.C.",
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
