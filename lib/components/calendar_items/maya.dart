import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
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

    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Long Count : ...',
          style: ThemeUtils.cardBodyTextStyle,
        ),
        Text(
          'Tzolkʼin : ...',
          style: ThemeUtils.cardBodyTextStyle,
        ),
        Text(
          'Haabʼ : ...',
          style: ThemeUtils.cardBodyTextStyle,
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
