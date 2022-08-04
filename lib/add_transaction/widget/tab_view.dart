import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:transaction_api/transaction_api.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Column(
        children: [
          TabBar(
            onTap: (value) => context.read<AddTransactionBloc>()
              ..add(
                AddTransactionTabChanged(TransactionType.values[value]),
              ),
            labelColor: Theme.of(context).primaryColor,
            tabs: const <Widget>[
              Tab(
                text: 'income',
              ),
              Tab(
                text: 'outcome',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
