// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_api/transaction_api.dart';

class TestTransactionApi extends TransactionApi {
  TestTransactionApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('TransactionApi', () {
    test('can be instantiated', () {
      expect(TestTransactionApi(), isNotNull);
    });
  });
}
