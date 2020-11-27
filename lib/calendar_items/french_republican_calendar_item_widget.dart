import 'package:calendar_converter/calendar_items/caledar_item_widget.dart';
import 'package:flutter/cupertino.dart';

class FrenchRepublicanCalendarItemWidget extends CalendarItemWidget {
  FrenchRepublicanCalendarItemWidget() {
    this.titleText = "French Republican";
    this.imageAsset = "assets/images/napoleon.png";
    this.body = Container();
  }
}
