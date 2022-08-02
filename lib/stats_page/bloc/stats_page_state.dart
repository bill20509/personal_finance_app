part of 'stats_page_bloc.dart';

enum StatsPageStatus {
  fail,
  success,
  initial,
  loading,
}

enum StatsPageMode {
  day,
  month,
  year,
}

class StatsPageState extends Equatable {
  const StatsPageState({
    this.txs = const [],
    this.status = StatsPageStatus.initial,
    this.mode = StatsPageMode.month,
    required this.startDate,
    required this.endDate,
    required this.startDateString,
    required this.endDateString,
  });

  final List<Transaction> txs;
  final StatsPageStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final String? startDateString;
  final String? endDateString;
  final StatsPageMode mode;
  StatsPageState copyWith({
    List<Transaction>? txs,
    StatsPageStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    StatsPageMode? mode,
    String? startDateString,
    String? endDateString,
  }) {
    return StatsPageState(
      txs: txs ?? this.txs,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      mode: mode ?? this.mode,
      startDateString: startDateString ?? this.startDateString,
      endDateString: endDateString ?? this.endDateString,
    );
  }

  @override
  List<Object?> get props => [
        txs,
        status,
        startDate,
        endDate,
        mode,
        startDateString,
        endDateString,
      ];
}
