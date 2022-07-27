import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

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
  const StatsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stats'),
      ),
      body: BlocBuilder<TransactionBloc, TransactionOverviewState>(
        builder: (context, state) {
          final txsList = context.read<TransactionBloc>().state.txs;
          final dataMap = <String, double>{};
          var totalValue = 0.0;
          for (final tx in txsList) {
            if (dataMap[tx.mainType] == null) {
              dataMap[tx.mainType] = 0;
            }
            dataMap[tx.mainType] = dataMap[tx.mainType]! + tx.amount;
            totalValue += tx.amount;
          }

          final colorList = <Color>[
            Colors.greenAccent,
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.purple,
          ];
          if (totalValue == 0) {
            return const Center(
              child: Text('No Stats QQ'),
            );
          }
          return Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              child: PieChart(
                centerText: '123',
                dataMap: dataMap,
                chartType: ChartType.ring,
                ringStrokeWidth: 40,
                baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                colorList: colorList,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                totalValue: totalValue,
              ),
            ),
          );
        },
      ),
    );
  }
}
