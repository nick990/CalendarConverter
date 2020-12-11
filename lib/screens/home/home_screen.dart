import 'package:calendar_converter/components/gradient_icon.dart';
import 'package:calendar_converter/providers/data_provider.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
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
      firstDate: DateTime(1582, 10, 15),
      lastDate: DateTime(3000),
      initialDatePickerMode: DatePickerMode.year,
      //helpText: 'Select date',
      // fieldLabelText: 'date',
    );
    if (picked != null && picked != date) {
      Provider.of<DataProvider>(context, listen: false).date = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);
    this.date = dataProvider.date;
    final formatter = DateFormat(settingsProvider.format);
    _setDateController(formatter);

    var header = Container(
      padding: EdgeInsets.symmetric(
        horizontal: ThemeUtils.defaultPadding * 3,
        vertical: ThemeUtils.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: ThemeUtils.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text('Calendar Converter',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: ThemeUtils.titleColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(ThemeUtils.defaultPadding * 1),
            decoration: BoxDecoration(
              gradient: ThemeUtils.gradient1,
              borderRadius: BorderRadius.all(
                Radius.circular(ThemeUtils.defaultPadding * 2),
              ),
            ),
            margin: EdgeInsets.symmetric(
              vertical: ThemeUtils.defaultPadding,
            ),
            child: Expanded(
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: TextField(
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.date_range,
                      size: 35,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: settingsProvider.format,
                    labelStyle: TextStyle(
                      fontSize: 20,
                      //backgroundColor: Colors.white,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(ThemeUtils.defaultPadding * 2),
                      borderSide: BorderSide(
                        color: ThemeUtils.primaryColor,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: ThemeUtils.defaultPadding * 2,
                      vertical: ThemeUtils.defaultPadding * 2,
                    ),
                  ),
                  controller: dateController,
                  enabled: false,
                  onSubmitted: (_) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          header,
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // JulianDayCalendarItemWidget(),
                  // MayaCalendarItemWidget(),
                  // FrenchRepublicanCalendarItemWidget(),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
