part of 'date_bloc.dart';

@immutable
abstract class DateEvent extends Equatable {
  const DateEvent();
  @override
  List<Object> get props => [];
}

class DatePicked extends DateEvent {
  final DateTime date;

  DatePicked({@required this.date});
}
