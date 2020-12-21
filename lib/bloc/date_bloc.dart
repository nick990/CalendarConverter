import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calendar_converter/utils/calendar_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateInitial(DateTime.now()));

  @override
  Stream<DateState> mapEventToState(
    DateEvent event,
  ) async* {
    if (event is DatePicked) {
      yield* _mapDatePickedToState(event);
    }
  }

  Stream<DateState> _mapDatePickedToState(DatePicked picked) async* {
    yield DateChanged(picked.date);
  }
}
