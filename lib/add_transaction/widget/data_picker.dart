import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      firstDate: DateTime(2020),
      initialDate: DateTime(2021),
      lastDate: DateTime(2025),
      onDateChanged: print,
    );
  }
}
