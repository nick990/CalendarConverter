import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
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
    final dataProvider = Provider.of<DataProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    _date = dataProvider.date;
    _format = DateFormat(settingsProvider.format);
    return CalendarItem(
      titleText: 'French Republican',
      imageAsset: 'assets/images/napoleon.png',
      body: Text(_format.format(_date)),
    );
  }
}
