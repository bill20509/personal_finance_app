import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';
part 'stats_page_state.dart';
part 'stats_page_event.dart';

class StatsPageBloc extends Bloc<StatsPageEvent, StatsPageState> {
  StatsPageBloc({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(const StatsPageState()) {}

  final TransactionRepository _transactionRepository;
}
