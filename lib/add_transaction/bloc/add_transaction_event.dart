part of 'add_transaction_bloc.dart';

abstract class AddTransactionEvent extends Equatable {
  const AddTransactionEvent();
  @override
  List<Object> get props => [];
}

class AddTransactionSubmitted extends AddTransactionEvent {
  const AddTransactionSubmitted();
}

class AddTransactionTitleChanged extends AddTransactionEvent {
  const AddTransactionTitleChanged(this.title);
  final String title;

  @override
  List<Object> get props => [title];
}

class AddTransactionAmountChanged extends AddTransactionEvent {
  const AddTransactionAmountChanged(this.amount);
  final double amount;

  @override
  List<Object> get props => [amount];
}
