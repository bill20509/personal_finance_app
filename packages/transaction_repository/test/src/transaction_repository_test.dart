// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:transaction_api/transaction_api.dart';
import 'package:transaction_repository/transaction_repository.dart';

class MockTransactionApi extends Mock implements TransactionApi {}

void main() {
  group('TransactionRepository', () {
    TransactionApi transactionApi = MockTransactionApi();
    setUp(() {
      transactionApi = MockTransactionApi();
    });
    test('can be instantiated', () {
      expect(TransactionRepository(transactionApi: transactionApi), isNotNull);
    });
  });
}
