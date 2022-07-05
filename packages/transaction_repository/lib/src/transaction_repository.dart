/// {@template transaction_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
import 'package:transaction_api/transaction_api.dart';

class TransactionRepository {
  /// {@macro transaction_repository}
  TransactionRepository({
    required TransactionApi transactionApi,
  }) : _transactionApi = transactionApi;

  /// api
  final TransactionApi _transactionApi;

  /// get
  Stream<List<Transaction>> getTransactions() =>
      _transactionApi.getTransactions();

  /// delete
  Future<void> deleteTransaction(String id) =>
      _transactionApi.deleteTransaction(id);

  /// save
  Future<void> saveTransaction(Transaction tx) =>
      _transactionApi.saveTransaction(tx);
}
