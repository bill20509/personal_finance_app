import 'package:transaction_api/transaction_api.dart';

/// {@template transaction_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract class TransactionApi {
  /// {@macro transaction_api}
  const TransactionApi();

  /// get all transactions
  Stream<List<Transaction>> getTransactions();

  /// save transactions
  Future<void> saveTransaction(Transaction tx);

  /// delete transactions
  Future<void> deleteTransaction(String? id);
}
