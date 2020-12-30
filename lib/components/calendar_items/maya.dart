import 'package:calendar_converter/bloc/date_bloc.dart';
import 'package:calendar_converter/components/calendar_items/calendar_item.dart';
import 'package:calendar_converter/utils/calendar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MayaCalendarItemWidget extends StatelessWidget {
  final bool imageOnLeft;

  MayaCalendarItemWidget({Key key, this.imageOnLeft = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateBloc, DateState>(
      builder: (context, state) {
        String longCount = CalendarUtils.getMayaLongCount(state.julianDay);
        var body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Long Count: $longCount',
            ),
            Text(
              'Tzolkʼin : ...',
            ),
            Text(
              'Haabʼ : ...',
            ),
          ],
        );
        return CalendarItem(
          titleText: 'Maya',
          imageAsset: 'assets/images/maya.png',
          body: body,
          imageOnLeft: imageOnLeft,
        );
      },
    );
  }
}
