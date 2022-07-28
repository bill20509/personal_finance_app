import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:personal_finance_app/transaction_overview/widget/trnsaction_card.dart';
import 'package:transaction_repository/transaction_repository.dart';

class TransactionOverviewPage extends StatelessWidget {
  const TransactionOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(
        transactionRepository: context.read<TransactionRepository>(),
      )
        ..add(const TransactionOverviewSubscriptionRequested())
        ..add(TransactionOverviewChangeDate(DateTime.now())),
      child: const TransactionOverviewView(),
    );
  }
}

class TransactionOverviewView extends StatelessWidget {
  const TransactionOverviewView({super.key});

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
                CalendarDatePicker(
                  firstDate: DateTime(2020),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2025),
                  onDateChanged: (date) => context
                      .read<TransactionBloc>()
                      .add(TransactionOverviewChangeDate(date)),
                ),
                Expanded(
                  flex: 2,
                  child: Builder(
                    builder: (context) {
                      if (state.txs.isEmpty) {
                        return const Center(child: Text("It's empty"));
                      }
                      return CupertinoScrollbar(
                        child: ListView.builder(
                          itemCount: state.txs.length,
                          itemBuilder: (context, index) {
                            final d = state.txs[index].date;
                            if (d.day == state.currentDate?.day &&
                                d.month == state.currentDate?.month &&
                                d.year == state.currentDate?.year) {
                              return TransactionCard(tx: state.txs[index]);
                            }
                            return Container();
                          },
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
