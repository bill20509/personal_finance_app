part of 'add_transaction_bloc.dart';

enum AddTransactionStatus {
  failure,
  loading,
  success,
  initial,
}

class AddTransactionState extends Equatable {
  const AddTransactionState({
    this.status = AddTransactionStatus.initial,
    this.initialTx,
    this.title = '',
    this.amount = 0.0,
    this.desc = '',
    required this.dateTime,
    this.transactionType = TransactionType.outcome,
    this.mainType = '',
    this.subType = '',
    this.selectImagePath,
  });
  final AddTransactionStatus status;
  final Transaction? initialTx;
  final String title;
  final double amount;
  final String desc;
  final DateTime dateTime;
  final TransactionType transactionType;
  final String mainType;
  final String subType;
  final String? selectImagePath;
  AddTransactionState copyWith({
    AddTransactionStatus? status,
    Transaction? initialTx,
    String? title,
    double? amount,
    String? desc,
    DateTime? dateTime,
    TransactionType? transactionType,
    String? mainType,
    String? subType,
    String? selectImagePath,
  }) {
    return AddTransactionState(
      status: status ?? this.status,
      initialTx: initialTx ?? this.initialTx,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      desc: desc ?? this.desc,
      dateTime: dateTime ?? this.dateTime,
      transactionType: transactionType ?? this.transactionType,
      mainType: mainType ?? this.mainType,
      subType: subType ?? this.subType,
      selectImagePath: selectImagePath ?? this.selectImagePath,
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
        transactionType,
        mainType,
        subType,
        selectImagePath,
      ];
}
