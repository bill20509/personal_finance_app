part of 'stats_page_bloc.dart';

class StatsPageState extends Equatable {
  const StatsPageState({
    this.txs,
  });

  final List<Transaction>? txs;
  @override
  List<Object?> get props => [
        txs,
      ];
}
