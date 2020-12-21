import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/utils/calendar_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MayaCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  DateFormat _format;
  final bool imageOnLeft;

  MayaCalendarItemWidget({Key key, this.imageOnLeft = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    _date = dataProvider.date;

    //August 11, 3114 BC
    int creationJD =
        CalendarUtils.getJulianDayFromDateTime(new DateTime(-3113, 8, 11));
    print(creationJD);
    // print(c

    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Long Count : ...',
        ),
        Text(
          'Tzolkʼin : ...',
        ),
        Text(
          'Haabʼ : ...',
        ),
      ],
    );

    return CalendarItem(
      titleText: 'Maya',
      imageAsset: 'assets/images/maya.png',
      body: body,
      imageOnLeft: imageOnLeft,
    );
  }
}
