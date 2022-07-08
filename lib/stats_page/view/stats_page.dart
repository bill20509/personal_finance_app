import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(transactionRepository: context.read<TransactionRepository>(),)..add(event),
      child: StatsPageView(),
    );
  }
}

class StatsPageView extends StatelessWidget {
  const StatsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stats'),
      ),
      body: Builder(
        builder: () {Transaction today_txs = },
      ),
    );
  }
}
