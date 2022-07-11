import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatsPageBloc(
        transactionRepository: context.read<TransactionRepository>(),
      )..add(
          const StatsPageSubscriptionRequested(),
        ),
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
      body: BlocBuilder<StatsPageBloc, StatsPageState>(
        builder: (context, state) {
          final txs = state.txs;
          var amount = 0.0;
          for (final tx in txs) {
            amount += tx.amount;
          }
          return Text(amount.toString());
        },
      ),
    );
  }
}
