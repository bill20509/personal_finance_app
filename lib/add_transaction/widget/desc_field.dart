import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

class DescType extends StatelessWidget {
  const DescType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              'desc : ',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: TextFormField(
              maxLength: 20,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: 'desc',
              ),
              onChanged: (title) => context
                  .read<AddTransactionBloc>()
                  .add(AddTransactionDescChanged(title)),
            ),
          ),
        ),
      ],
    );
  }
}
