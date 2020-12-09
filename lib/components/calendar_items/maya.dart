import 'package:calendar_converter/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'caledar_item_widget.dart';

class MayaCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  DateFormat _format;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    _date = dataProvider.date;

    var body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Long Count : ...'),
        Text('Tzolkʼin : ...'),
        Text('Haabʼ : ...'),
      ],
    );

    return CalendarItemWidget(
      titleText: 'Maya',
      imageAsset: 'assets/images/maya.png',
      body: body,
    );
  }
}
