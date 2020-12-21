part of 'date_bloc.dart';

@immutable
abstract class DateState extends Equatable {
  final DateTime date;
  const DateState(this.date);

  @override
  List<Object> get props => [date];
}

class DateInitial extends DateState {
  DateInitial(DateTime date) : super(date);

  @override
  String toString() => 'DateInitial { date: $date }';
}

class DateChanged extends DateState {
  DateChanged(DateTime date) : super(date);

  @override
  String toString() => 'DateChanged { date: $date }';
}
