import 'package:calendar_converter/calendar_items/caledar_item_widget.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MayaCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  DateFormat _format;
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    _date = settingsProvider.date;
    _format = DateFormat(settingsProvider.format);

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
