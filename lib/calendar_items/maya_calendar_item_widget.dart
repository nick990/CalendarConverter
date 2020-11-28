import 'package:calendar_converter/calendar_items/caledar_item_widget.dart';
import 'package:flutter/material.dart';

class MayaCalendarBody extends StatelessWidget {
  final String titleText;

  const MayaCalendarBody({Key key, this.titleText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}

// ignore: must_be_immutable
class MayaCalendarItemWidget extends CalendarItemWidget {
  MayaCalendarItemWidget() {
    this.titleText = "Maya";
    this.imageAsset = "assets/images/maya.png";
    this.body = MayaCalendarBody(
      titleText: this.titleText,
    );
  }
}
