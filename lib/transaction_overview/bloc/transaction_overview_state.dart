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
  });
  final TransactionOverviewStatus status;
  final List<Transaction> txs;
  final Transaction? lastestDeletedTx;
  TransactionOverviewState copyWith({
    TransactionOverviewStatus? status,
    List<Transaction>? txs,
    Transaction? lastestDeletedTx,
  }) {
    return TransactionOverviewState(
      status: status ?? this.status,
      txs: txs ?? this.txs,
      lastestDeletedTx: lastestDeletedTx ?? this.lastestDeletedTx,
    );
  }

  @override
  List<Object?> get props => [
        status,
        txs,
        lastestDeletedTx,
      ];
}
