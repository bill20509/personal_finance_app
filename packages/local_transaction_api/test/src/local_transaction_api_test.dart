// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:local_transaction_api/local_transaction_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';

class MockSharePreference extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences plugin;
  group('LocalTransactionApi', () {
    setUp(() {
      plugin = MockSharePreference();
    });
    test('can be instantiated', () {
      expect(LocalTransactionApi(plugin: plugin), isNotNull);
    });
  });
}
