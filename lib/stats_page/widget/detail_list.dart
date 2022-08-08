import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:personal_finance_app/transaction_overview/widget/trnsaction_card.dart';

class DetailList extends StatelessWidget {
  const DetailList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = <Column>[];
    final txs = context.read<StatsPageBloc>().state.txs
      ..sort(
        (a, b) => a.date.compareTo(b.date),
      );
    for (var i = 0; i < txs.length; i++) {
      final txList = <TransactionCard>[TransactionCard(tx: txs[i])];
      while (i < txs.length - 1 &&
          txs[i].date.month == txs[i + 1].date.month &&
          txs[i].date.day == txs[i + 1].date.day) {
        i++;
        txList.add(TransactionCard(tx: txs[i]));
      }
      itemList.add(
        Column(
          children: [
            Text('${txList[0].tx.date.month}/${txList[0].tx.date.day}'),
            for (final tx in txList) tx,
          ],
        ),
      );
    }

    return CupertinoScrollbar(
      child: ListView(
        children: [for (final item in itemList) item],
      ),
    );
  }
}
