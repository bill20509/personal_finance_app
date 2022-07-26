part of 'transaction_overview_bloc.dart';

enum TransactionOverviewStatus {
  fail,
  loading,
  success,
  initial,
}

class TransactionOverviewState extends Equatable {
  const TransactionOverviewState({
    this.status = TransactionOverviewStatus.initial,
    this.txs = const [],
    this.lastestDeletedTx,
    this.currentDate,
  });
  final TransactionOverviewStatus status;
  final List<Transaction> txs;
  final Transaction? lastestDeletedTx;
  final DateTime? currentDate;
  TransactionOverviewState copyWith({
    TransactionOverviewStatus? status,
    List<Transaction>? txs,
    Transaction? lastestDeletedTx,
    DateTime? currentDate,
  }) {
    return TransactionOverviewState(
      status: status ?? this.status,
      txs: txs ?? this.txs,
      lastestDeletedTx: lastestDeletedTx ?? this.lastestDeletedTx,
      currentDate: currentDate ?? this.currentDate,
    );
  }

  @override
  List<Object?> get props => [
        status,
        txs,
        lastestDeletedTx,
        currentDate,
      ];
}
