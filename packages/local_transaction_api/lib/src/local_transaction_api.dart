/// {@template local_transaction_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_api/transaction_api.dart';

class LocalTransactionApi extends TransactionApi {
  /// {@macro local_transaction_api}
  LocalTransactionApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }
  final SharedPreferences _plugin;
  final key = '__transaction_history_key__';
  final _transactionStreamController =
      BehaviorSubject<List<Transaction>>.seeded(const []);

  String? _getValue() => _plugin.getString(key);
  Future<void> _setValue(String value) => _plugin.setString(key, value);
  void _init() {
    final txJson = _getValue();
    if (txJson != null) {
      final txs = List<Map>.from(jsonDecode(txJson) as List)
          .map((e) => Transaction.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      _transactionStreamController.add(txs);
    } else {
      _transactionStreamController.add(const []);
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final txs = [..._transactionStreamController.value];
    final index = txs.indexWhere((element) => element.id == id);
    if (index == -1) {
      throw TransactionNotFound();
    } else {
      txs.removeAt(index);
      _transactionStreamController.add(txs);
      return _setValue(jsonEncode(txs));
    }
  }

  @override
  Stream<List<Transaction>> getTransactions() {
    return _transactionStreamController.asBroadcastStream();
  }

  @override
  Future<void> saveTransaction(Transaction tx) async {
    final txs = [..._transactionStreamController.value];
    final index = txs.indexWhere((element) => element.id == tx.id);
    if (index >= 0) {
      txs[index] = tx;
    } else {
      txs.add(tx);
    }
    _transactionStreamController.add(txs);
    return _setValue(jsonEncode(txs));
  }
}
