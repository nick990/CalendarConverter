import 'package:calendar_converter/bloc/date_bloc.dart';
import 'package:calendar_converter/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderWithDatePicker extends StatelessWidget {
  final TextEditingController dateController;
  final String format;

  const HeaderWithDatePicker({
    Key key,
    @required this.dateController,
    @required this.format,
  }) : super(key: key);

  _selectDate(BuildContext context) async {
    final dateBloc = BlocProvider.of<DateBloc>(context);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateBloc.state.date,
      firstDate: DateTime(1582, 10, 15),
      lastDate: DateTime(3000),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != dateBloc.state.date) {
      dateBloc.add(DatePicked(date: picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ThemeUtils.defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: ThemeUtils.defaultPadding * 3,
        vertical: ThemeUtils.defaultPadding,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeUtils.primaryColor,
            blurRadius: 20.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
            // offset: Offset(
            //   15.0, // Move to right 10  horizontally
            //   15.0, // Move to bottom 10 Vertically
            // ),
          )
        ],
        color: ThemeUtils.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            //height: 100,
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
                  labelText: this.format,
                  labelStyle: TextStyle(
                    fontSize: 20,
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
        ],
      ),
    );
  }
}
