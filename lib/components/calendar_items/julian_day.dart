import 'package:calendar_converter/bloc/date_bloc.dart';
import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/utils/calendar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JulianDayCalendarItemWidget extends StatelessWidget {
  final bool imageOnLeft;

  JulianDayCalendarItemWidget({Key key, this.imageOnLeft = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateBloc, DateState>(
      builder: (context, state) {
        var body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${CalendarUtils.formatNumber(state.julianDay)}\n\nDays elapsed since\nJanuary 1 4713 B.C.",
            ),
          ],
        );
        return CalendarItem(
          titleText: 'Julian day',
          imageAsset: 'assets/images/maya.png',
          body: body,
          imageOnLeft: imageOnLeft,
        );
      },
    );
  }
}
