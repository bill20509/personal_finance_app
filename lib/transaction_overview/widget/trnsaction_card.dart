import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/home/bloc/transaction_overview_bloc.dart';
import 'package:personal_finance_app/transaction_overview/widget/transaction_detail_page.dart';
import 'package:transaction_api/transaction_api.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.tx,
  });
  final Transaction tx;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final txBloc = context.read<TransactionBloc>();
        final result = await showDialog<int>(
          context: context,
          builder: (context) => TransactionDetailPage(tx: tx),
        );
        if (result == 1) {
          txBloc.add(
            TransactionOverviewDeleteRequested(tx),
          );
        }
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          height: 70,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.dinner_dining,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(tx.title),
                  ],
                ),
                Text(
                  '${tx.transactionType == TransactionType.outcome ? '-' : '+'} ${tx.amount}',
                  style: TextStyle(
                    color: tx.transactionType == TransactionType.outcome
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
