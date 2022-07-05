import 'package:equatable/equatable.dart';

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
  const TransactionOverviewDeleteRequested();
}

class TransactionOverview
