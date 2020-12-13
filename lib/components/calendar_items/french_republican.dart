import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FrenchRepublicanCalendarItemWidget extends StatelessWidget {
  DateTime _date;
  DateFormat _format;
  final bool imageOnLeft;

  FrenchRepublicanCalendarItemWidget({Key key, this.imageOnLeft = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    _date = dataProvider.date;
    _format = DateFormat(settingsProvider.format);
    return CalendarItem(
      titleText: 'French Republican',
      imageAsset: 'assets/images/napoleon.png',
      body: Text(
        _format.format(_date),
        style: ThemeUtils.cardBodyTextStyle,
      ),
      imageOnLeft: imageOnLeft,
    );
  }
}
