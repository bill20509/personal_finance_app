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
    required this.startDate,
    required this.endDate,
  });

  final List<Transaction> txs;
  final StatsPageStatus status;
  final DateTime startDate;
  final DateTime endDate;
  StatsPageState copyWith({
    List<Transaction>? txs,
    StatsPageStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return StatsPageState(
      txs: txs ?? this.txs,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [
        txs,
        status,
      ];
}
