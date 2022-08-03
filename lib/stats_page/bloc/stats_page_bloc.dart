import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
            startDate: DateTime.fromMicrosecondsSinceEpoch(0),
            endDate: DateTime.fromMicrosecondsSinceEpoch(0),
            startDateString: '',
            endDateString: '',
          ),
        ) {
    on<StatsPageSubscriptionRequested>(_onSubscriptionRequested);
    on<StatsPageDateUpdated>(_onDateUpdate);
    on<StatsPageFilterChanged>(_onFilterChanged);
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
        txs: data
            .where(
              (element) =>
                  element.date.isAfter(state.startDate) &&
                  element.date.isBefore(state.endDate),
            )
            .toList(),
      ),
      onError: (_, __) => state.copyWith(
        status: StatsPageStatus.fail,
      ),
    );
  }

  Future<void> _onFilterChanged(
    StatsPageFilterChanged event,
    Emitter<StatsPageState> emit,
  ) async {
    emit(state.copyWith(status: StatsPageStatus.loading));
    try {
      // TODO(bill): probably bug?
      final txs = await _transactionRepository.getTransactions().first;
      emit(
        state.copyWith(
          status: StatsPageStatus.success,
          txs: txs
              .where(
                (element) =>
                    element.date.isAfter(state.startDate) &&
                    element.date.isBefore(state.endDate),
              )
              .toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: StatsPageStatus.fail));
    }
  }

  Future<void> _onDateUpdate(
    StatsPageDateUpdated event,
    Emitter<StatsPageState> emit,
  ) async {
    emit(state.copyWith(status: StatsPageStatus.loading));
    final startYear = event.now.year;
    final startMonth = event.now.month;
    final startDay = event.now.day;
    switch (state.mode) {
      case StatsPageMode.day:
        // TODO: Handle this case.
        break;
      case StatsPageMode.month:
        final startDate = DateTime.utc(startYear, startMonth + event.offset, 1);
        final endDate =
            DateTime.utc(startYear, startMonth + event.offset + 1, 0);
        emit(
          state.copyWith(
            status: StatsPageStatus.success,
            startDateString: DateFormat('yyyy-MM-dd').format(startDate),
            endDateString: DateFormat('yyyy-MM-dd').format(endDate),
            startDate: startDate,
            endDate: endDate,
          ),
        );
        break;
      case StatsPageMode.year:
        // TODO: Handle this case.
        break;
    }
  }

  // Future<void> _onPrevDate(
  //   StatsPagePrevDate event,
  //   Emitter<StatsPageState> emit,
  // ) async {
  //   switch (state.mode) {
  //     case StatsPageMode.day:
  //       // TODO: Handle this case.
  //       break;
  //     case StatsPageMode.month:
  //       final start = DateTime(
  //         state.startDate.year,
  //         state.startDate.month - 1,
  //         state.startDate.day,
  //       );
  //       final end = DateTime(
  //         state.endDate.year,
  //         state.endDate.month - 1,
  //         state.endDate.day,
  //       );
  //       emit(
  //         state.copyWith(
  //           startDate: start,
  //           endDate: end,
  //         ),
  //       );
  //       break;
  //     case StatsPageMode.year:
  //       // TODO: Handle this case.
  //       break;
  //   }
  // }
}
