import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import './transaction_detail_page.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.tx,
  }) : super(key: key);
  final Transaction tx;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showDialog<int>(
          context: context,
          builder: (context) => TransactionDetailPage(tx: tx),
        );
        if (result == 1) {
          context.read<TransactionBloc>().add(
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
                    SizedBox(
                      width: 20,
                    ),
                    Text(tx.title),
                  ],
                ),
                Text('+ ${tx.amount}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
