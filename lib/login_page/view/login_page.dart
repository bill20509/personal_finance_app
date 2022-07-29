import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/home/home.dart';
import 'package:personal_finance_app/login_page/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginBloc(authRepository: context.read<AuthRepository>())
            ..add(const LoginStateRequested()),
      child: Scaffold(
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
          final nav = Navigator.of(context);
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
