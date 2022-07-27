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

class AddTransactionMainTypeChanged extends AddTransactionEvent {
  const AddTransactionMainTypeChanged(this.mainType);
  final String mainType;

  @override
  List<Object> get props => [mainType];
}

class AddTransactionSubTypeChanged extends AddTransactionEvent {
  const AddTransactionSubTypeChanged(this.subType);
  final String subType;

  @override
  List<Object> get props => [subType];
}

class AddTransactionDescChanged extends AddTransactionEvent {
  const AddTransactionDescChanged(this.desc);
  final String desc;
  @override
  List<Object> get props => [desc];
}

class AddTransactionDateChanged extends AddTransactionEvent {
  const AddTransactionDateChanged(this.date);
  final DateTime date;
  @override
  List<Object> get props => [date];
}

class AddTransactionPhotoChanged extends AddTransactionEvent {
  const AddTransactionPhotoChanged(this.selectImagePath);
  final String selectImagePath;
  @override
  List<Object> get props => [selectImagePath];
}
