import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  AddTransactionBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(
          AddTransactionState(
            dateTime: DateTime.now(),
          ),
        ) {
    on<AddTransactionSubmitted>(_onSubmitted);
    on<AddTransactionAmountChanged>(_onAmountChanged);
    on<AddTransactionTitleChanged>(_onTitleChanged);
  }
  final TransactionRepository _transactionRepository;
  Future<void> _onSubmitted(
    AddTransactionSubmitted event,
    Emitter<AddTransactionState> emit,
  ) async {
    emit(state.copyWith(status: AddTransactionStatus.loading));
    final tx = Transaction(
      title: state.title,
      date: state.dateTime,
      desc: state.desc,
      amount: state.amount,
    );
    try {
      await _transactionRepository.saveTransaction(tx);
      emit(state.copyWith(status: AddTransactionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddTransactionStatus.failure));
    }
  }

  void _onTitleChanged(
    AddTransactionTitleChanged event,
    Emitter emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onAmountChanged(
    AddTransactionAmountChanged event,
    Emitter emit,
  ) {
    emit(state.copyWith(amount: event.amount));
  }
}
