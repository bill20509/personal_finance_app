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
    on<AddTransactionMainTypeChanged>(_onMainTypeChanged);
    on<AddTransactionSubTypeChanged>(_onSubTypeChanged);
    on<AddTransactionDateChanged>(_onDateChanged);
    on<AddTransactionPhotoChanged>(_onSelectImageChanged);
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
      transactionType: state.transactionType,
      mainType: state.mainType,
      subType: state.subType,
      imagePath: state.selectImagePath,
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
    Emitter<AddTransactionState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onAmountChanged(
    AddTransactionAmountChanged event,
    Emitter<AddTransactionState> emit,
  ) {
    emit(state.copyWith(amount: event.amount));
  }

  void _onMainTypeChanged(
    AddTransactionMainTypeChanged event,
    Emitter<AddTransactionState> emit,
  ) {
    emit(state.copyWith(mainType: event.mainType));
  }

  void _onSubTypeChanged(
    AddTransactionSubTypeChanged event,
    Emitter<AddTransactionState> emit,
  ) {
    emit(state.copyWith(subType: event.subType));
  }

  void _onDateChanged(
      AddTransactionDateChanged event, Emitter<AddTransactionState> emit) {
    emit(state.copyWith(dateTime: event.date));
  }

  void _onSelectImageChanged(
      AddTransactionPhotoChanged event, Emitter<AddTransactionState> emit) {
    emit(state.copyWith(selectImagePath: event.selectImagePath));
  }
}
