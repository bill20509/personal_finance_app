import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

class DateSelect extends StatelessWidget {
  const DateSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              '時間 : ',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<AddTransactionBloc, AddTransactionState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  await showDialog<DateTime>(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: CalendarDatePicker(
                          firstDate: DateTime(2020),
                          initialDate:
                              context.read<AddTransactionState>().dateTime,
                          lastDate: DateTime(2025),
                          onDateChanged: (date) {
                            context
                                .read<AddTransactionBloc>()
                                .add(AddTransactionDateChanged(date));
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
                    border: Border.all(),
                  ),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    child: Builder(
                      builder: (context) {
                        final today = DateTime.now();
                        var txt = '今天';
                        final currentDate =
                            context.read<AddTransactionState>().dateTime;
                        if (currentDate.day != today.day ||
                            currentDate.month != today.month ||
                            currentDate.year != today.year) {
                          txt =
                              '${currentDate.year}-${currentDate.month}-${currentDate.day}';
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
              );
            },
          ),
        ),
      ],
    );
  }
}
