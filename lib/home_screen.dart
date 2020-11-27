import 'package:calendar_converter/calendar_items/caledar_item_widget.dart';
import 'package:calendar_converter/calendar_items/french_republican_calendar_item_widget.dart';
import 'package:calendar_converter/calendar_items/maya_calendar_item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Card(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: Text(
                  'Date selector',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
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
