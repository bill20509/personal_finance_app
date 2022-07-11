part of 'stats_page_bloc.dart';

enum StatsPageStatus {
  fail,
  success,
  initial,
  loading,
}

class StatsPageState extends Equatable {
  const StatsPageState({
    this.txs = const [],
    this.status = StatsPageStatus.initial,
  });

  final List<Transaction> txs;
  final StatsPageStatus status;

  StatsPageState copyWith({
    List<Transaction>? txs,
    StatsPageStatus? status,
  }) {
    return StatsPageState(
      txs: txs ?? this.txs,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        txs,
        status,
      ];
}
