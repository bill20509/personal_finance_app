import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({Key? key}) : super(key: key);

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  late DateTime currentData = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              '時間 : ',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () async {
              final result = showDialog<DateTime>(
                context: context,
                builder: (context) => AlertDialog(
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CalendarDatePicker(
                      firstDate: DateTime(2020),
                      initialDate: currentData,
                      lastDate: DateTime(2025),
                      onDateChanged: (date) {
                        setState(() {
                          currentData = date;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Builder(
                  builder: (context) {
                    final today = DateTime.now();
                    var txt = '今天';
                    if (currentData.day != today.day ||
                        currentData.month != today.month ||
                        currentData.year != today.year) {
                      txt =
                          '${currentData.year}-${currentData.month}-${currentData.day}';
                    }
                    return Text(
                      txt,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
