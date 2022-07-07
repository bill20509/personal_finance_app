import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

part 'transaction_overview_event.dart';
part 'transaction_overview_state.dart';

class TransactionBloc
    extends Bloc<TransactionOverviewEvent, TransactionOverviewState> {
  TransactionBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(const TransactionOverviewState()) {
    on<TransactionOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }
  final TransactionRepository _transactionRepository;

  Future<void> _onSubscriptionRequested(
    TransactionOverviewSubscriptionRequested event,
    Emitter<TransactionOverviewState> emit,
  ) async {
    emit(state.copyWith(status: TransactionOverviewStatus.loading));
    await emit.forEach<List<Transaction>>(
      _transactionRepository.getTransactions(),
      onData: (txs) => state.copyWith(
        status: TransactionOverviewStatus.success,
        txs: txs,
      ),
      onError: (_, __) => state.copyWith(
        status: TransactionOverviewStatus.fail,
      ),
    );
  }
}