import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

class TransactionPieChart extends StatelessWidget {
  const TransactionPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final txsList = context.read<StatsPageBloc>().state.txs;
      final dataMap = <String, double>{};
      final state = context.read<StatsPageBloc>().state;
      var totalValue = 0.0;
      final title = state.mode == StatsPageMode.month
          ? '${state.startDate.year}/${state.startDate.month}'
          : state.mode == StatsPageMode.year
              ? '${state.startDate.year}'
              : '${state.startDate.year}/${state.startDate.month}/${state.startDate.day}';
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
      if (txsList.isEmpty) {
        return const Center(
          child: Text('No Stats QQ'),
        );
      }
      return Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: PieChart(
            centerText: title,
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
    });
  }
}
