// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_finance_app/app/bloc/login/bloc/login_bloc.dart';
import 'package:personal_finance_app/home/home.dart';
import 'package:personal_finance_app/l10n/l10n.dart';
import 'package:personal_finance_app/login_page/view/login_page.dart';
import 'package:transaction_repository/transaction_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.transactionRepository,
    required this.authRepository,
  }) : super(key: key);
  final TransactionRepository transactionRepository;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TransactionRepository>.value(
          value: transactionRepository,
        ),
        RepositoryProvider<AuthRepository>.value(
          value: authRepository,
        ),
      ],
      child: BlocProvider(
        create: (BuildContext context) =>
            LoginBloc(authRepository: context.read<AuthRepository>())
              ..add(const LoginStateRequested()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
          ),
        ),
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 37, 52)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color.fromARGB(255, 2, 37, 52),
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
