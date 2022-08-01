import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/stats_page/bloc/stats_page_bloc.dart';
import 'package:personal_finance_app/stats_page/widget/pie_chart.dart';
import 'package:personal_finance_app/transaction_overview/bloc/transaction_overview_bloc.dart';
import 'package:transaction_repository/transaction_repository.dart';

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.person_outline),
          title: Text(
            'Stats',
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_left_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '123',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_right_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text('Overview'),
                    ),
                    Tab(
                      child: Text('Detail'),
                    ),
                    Tab(
                      child: Text('Pie chart'),
                    ),
                    Tab(
                      child: Text('Ranking'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.add_alert),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Tab 1'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 2'),
              ),
            ),
            Container(
              child: Center(
                child: const TransactionPieChart(),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
