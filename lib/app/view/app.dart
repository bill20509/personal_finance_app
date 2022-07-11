// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_finance_app/home/home.dart';
import 'package:personal_finance_app/l10n/l10n.dart';
import 'package:transaction_repository/transaction_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.transactionRepository}) : super(key: key);
  final TransactionRepository transactionRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: transactionRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
          ),
        ),
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 37, 52)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Color.fromARGB(255, 2, 37, 52),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
