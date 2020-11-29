import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'caledar_item_widget.dart';

class FrenchRepublicanCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  DateFormat _format;
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    _date = settingsProvider.date;
    _format = DateFormat(settingsProvider.format);
    return CalendarItemWidget(
      titleText: 'French Republican',
      imageAsset: 'assets/images/napoleon.png',
      body: Text(_format.format(_date)),
    );
  }
}
