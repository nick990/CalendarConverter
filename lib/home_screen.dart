import 'package:calendar_converter/calendar_items/french_republican_calendar_item_widget.dart';
import 'package:calendar_converter/calendar_items/maya_calendar_item_widget.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:calendar_converter/widgets/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date;
  final dateController = TextEditingController();

  _setDateController(DateFormat formatter) {
    dateController.text = "${formatter.format(date)}";
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1000),
        lastDate: DateTime(3000),
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select birthday date',
        fieldLabelText: 'Birthday date');
    if (picked != null && picked != date) {
      Provider.of<SettingsProvider>(context, listen: false).date = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    this.date = settingsProvider.date;
    final formatter = DateFormat(settingsProvider.format);
    _setDateController(formatter);

    var dateSelector = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: TextField(
                    // style: Theme.of(context).textTheme.headline3,
                    decoration: InputDecoration(
                      //labelText: 'Gregorian Calendar',
                      disabledBorder: ThemeUtils.textInputBorder,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GradientIcon(
                          icon: Icons.date_range,
                          size: 45,
                          gradient: ThemeUtils.gradient1,
                        ),
                      ),
                    ),
                    controller: dateController,
                    enabled: false,
                    onSubmitted: (_) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar Converter',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            dateSelector,
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  MayaCalendarItemWidget(),
                  FrenchRepublicanCalendarItemWidget(),
                  MayaCalendarItemWidget(),
                  FrenchRepublicanCalendarItemWidget(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
