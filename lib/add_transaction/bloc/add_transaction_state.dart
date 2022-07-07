part of 'add_transaction_bloc.dart';

enum AddTransactionStatus {
  failure,
  loading,
  success,
  initial,
}

class AddTransactionState extends Equatable {
  AddTransactionState({
    this.status = AddTransactionStatus.initial,
    this.initialTx,
    this.title = '',
    this.amount = 0.0,
    this.desc = '',
    required this.dateTime,
  });
  final AddTransactionStatus status;
  final Transaction? initialTx;
  final String title;
  final double amount;
  final String desc;
  final DateTime dateTime;

  AddTransactionState copyWith({
    AddTransactionStatus? status,
    Transaction? initialTx,
    String? title,
    double? amount,
    String? desc,
    DateTime? dateTime,
  }) {
    return AddTransactionState(
      status: status ?? this.status,
      initialTx: initialTx ?? this.initialTx,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      desc: desc ?? this.desc,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [
        status,
        initialTx,
        title,
        amount,
        desc,
        dateTime,
      ];
}
