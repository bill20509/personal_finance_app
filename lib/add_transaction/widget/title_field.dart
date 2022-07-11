import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

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
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          hintText: 'title',
        ),
        onChanged: (title) => context
            .read<AddTransactionBloc>()
            .add(AddTransactionTitleChanged(title)),
      ),
    );
  }
}
