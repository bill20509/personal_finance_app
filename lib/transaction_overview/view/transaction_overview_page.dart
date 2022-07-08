import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

import '../widget/trnsaction_card.dart';

class TransactionOverviewPage extends StatelessWidget {
  const TransactionOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(
        transactionRepository: context.read<TransactionRepository>(),
      )..add(const TransactionOverviewSubscriptionRequested()),
      child: const TransactionOverviewView(),
    );
  }
}

class TransactionOverviewView extends StatelessWidget {
  const TransactionOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TransactionBloc, TransactionOverviewState>(
            listener: (conetext, state) {
              if (state.status == TransactionOverviewStatus.fail) {
                ScaffoldMessenger.of(conetext)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('error'),
                    ),
                  );
              }
            },
          ),
        ],
        child: BlocBuilder<TransactionBloc, TransactionOverviewState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Builder(
                    builder: (context) {
                      var count = 0.0;
                      for (final tx in state.txs) {
                        count += tx.amount;
                      }
                      return Center(
                        child: Text('total amount: $count}'),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Builder(
                    builder: (context) {
                      if (state.txs.isEmpty) return const Text("It's empty");
                      return CupertinoScrollbar(
                        child: ListView(
                          children: [
                            for (final tx in state.txs) TransactionCard(tx: tx),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
