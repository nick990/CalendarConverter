import 'package:calendar_converter/bloc/date_bloc.dart';
import 'package:calendar_converter/components/calendar_items/french_republican.dart';
import 'package:calendar_converter/components/calendar_items/julian_day.dart';
import 'package:calendar_converter/components/calendar_items/maya.dart';
import 'package:calendar_converter/providers/settings_provider.dart';
import 'package:calendar_converter/screens/home/components/header_with_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final dateController = TextEditingController();

  _setDateController(DateFormat formatter, DateTime date) {
    dateController.text = "${formatter.format(date)}";
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    final formatter = DateFormat(settingsProvider.format);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocBuilder<DateBloc, DateState>(
        builder: (context, state) {
          _setDateController(formatter, state.date);
          return Column(
            children: [
              HeaderWithDatePicker(
                dateController: dateController,
                format: settingsProvider.format,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      JulianDayCalendarItemWidget(),
                      FrenchRepublicanCalendarItemWidget(
                        imageOnLeft: false,
                      ),
                      MayaCalendarItemWidget(),
                    ],
                  ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
