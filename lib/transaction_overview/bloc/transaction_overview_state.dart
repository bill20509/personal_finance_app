import 'package:equatable/equatable.dart';
import 'package:transaction_api/transaction_api.dart';

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

  @override
  List<Object?> get props => [
        status,
        txs,
        lastestDeletedTx,
      ];
}
