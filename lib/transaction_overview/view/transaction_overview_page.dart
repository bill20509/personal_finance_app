import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

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
            // final txs = TransactionOverviewState(
            //   txs: [
            //     Transaction(
            //       date: DateTime.now(),
            //       title: 'test',
            //     ),
            //     Transaction(
            //       date: DateTime.now(),
            //       title: 'test1',
            //     ),
            //     Transaction(
            //       date: DateTime.now(),
            //       title: 'test2',
            //     ),
            //   ],
            // );
            if (state.txs.isEmpty) {
              return const Text("It's empty");
            }
            return CupertinoScrollbar(
              child: ListView(
                children: [
                  for (final tx in state.txs)
                    Text(
                      'amount: ${tx.amount}, title: ${tx.title}',
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}