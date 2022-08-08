import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/home/bloc/transaction_overview_bloc.dart';
import 'package:personal_finance_app/home/cubit/home_cubit.dart';
import 'package:personal_finance_app/stats_page/stats_page.dart';
import 'package:personal_finance_app/transaction_overview/transaction_overview_page.dart';
import 'package:transaction_repository/transaction_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => TransactionBloc(
              transactionRepository: context.read<TransactionRepository>())
            ..add(const TransactionOverviewSubscriptionRequested())
            ..add(
              TransactionOverviewChangeDate(DateTime.now()),
            ),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      body: IndexedStack(
        index: selectTab.index,
        children: const [
          TransactionOverviewPage(),
          StatsPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectTab,
              value: HomeTab.overview,
              icon: const Icon(Icons.list_rounded),
            ),
            _HomeTabButton(
              groupValue: selectTab,
              value: HomeTab.stats,
              icon: const Icon(Icons.show_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
  }) : super(key: key);
  final HomeTab groupValue;
  final HomeTab value;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      icon: icon,
      color:
          groupValue == value ? Theme.of(context).colorScheme.secondary : null,
    );
  }
}
