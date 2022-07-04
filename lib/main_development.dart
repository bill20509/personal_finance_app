// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:local_transaction_api/local_transaction_api.dart';
import 'package:personal_finance_app/app/app.dart';
import 'package:personal_finance_app/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final transactionApi = const LocalTransactionApi();
  bootstrap(transactionApi: transactionApi);
}
