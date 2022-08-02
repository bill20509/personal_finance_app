import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:personal_finance_app/stats_page/stats_page.dart';

import 'package:personal_finance_app/transaction_overview/widget/trnsaction_card.dart';

class RankingList extends StatelessWidget {
  const RankingList({super.key});

  @override
  Widget build(BuildContext context) {
    final txs = context.read<StatsPageBloc>().state.txs
      ..sort(
        (a, b) => a.amount < b.amount ? 1 : -1,
      );
    return CupertinoScrollbar(
      child: ListView.builder(
        itemCount: txs.length,
        itemBuilder: (context, index) => TransactionCard(
          tx: txs[index],
        ),
      ),
    );
  }
}
