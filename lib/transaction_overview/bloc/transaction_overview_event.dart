part of 'transaction_overview_bloc.dart';

abstract class TransactionOverviewEvent extends Equatable {
  const TransactionOverviewEvent();
  @override
  List<Object?> get props => [];
}

class TransactionOverviewSubscriptionRequested
    extends TransactionOverviewEvent {
  const TransactionOverviewSubscriptionRequested();
}

class TransactionOverviewDeleteRequested extends TransactionOverviewEvent {
  const TransactionOverviewDeleteRequested(this.tx);
  final Transaction tx;
}
