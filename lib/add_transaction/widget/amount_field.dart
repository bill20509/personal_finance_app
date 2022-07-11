import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

class AmountField extends StatelessWidget {
  const AmountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          hintText: '0',
        ),
        onChanged: (amount) => context
            .read<AddTransactionBloc>()
            .add(AddTransactionAmountChanged(double.parse(amount))),
      ),
    );
  }
}
