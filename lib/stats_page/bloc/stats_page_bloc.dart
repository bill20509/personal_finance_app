import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';
part 'stats_page_state.dart';
part 'stats_page_event.dart';

class StatsPageBloc extends Bloc<StatsPageEvent, StatsPageState> {
  StatsPageBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(
          StatsPageState(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          ),
        ) {
    on<StatsPageSubscriptionRequested>(_onSubscriptionRequested);
  }

  final TransactionRepository _transactionRepository;
  Future<void> _onSubscriptionRequested(
    StatsPageSubscriptionRequested event,
    Emitter<StatsPageState> emit,
  ) async {
    emit(state.copyWith(status: StatsPageStatus.loading));
    await emit.forEach<List<Transaction>>(
      _transactionRepository.getTransactions(),
      onData: (data) => state.copyWith(
        status: StatsPageStatus.success,
        txs: data,
      ),
      onError: (_, __) => state.copyWith(
        status: StatsPageStatus.fail,
      ),
    );
  }

  Future<void> _onFilterTransaction(
      StatsPageFilterTransaction event, Emitter<StatsPageState> emit) async {
    var txs = _transactionRepository.getTransactions();
  }
}
