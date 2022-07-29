import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/app/bloc/login/bloc/login_bloc.dart';
import 'package:personal_finance_app/home/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.status == LoginStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == LoginStatus.logout) {
            return LoginPageView();
          } else if (state.status == LoginStatus.login) {
            return const HomePage();
          }
          return Container();
        },
      ),
    );
  }
}

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});
  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          final ctx = Navigator.of(context);
          final ok = await _authRepository.signInWithGoogle();
          if (ok) {
            await nav.pushReplacement(
              HomePage.route(),
            );
          }
        },
        child: Text("SIGN IN"),
      ),
    );
  }
}
