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
      appBar: AppBar(title: Text('LoginPage')),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.login) {
            Navigator.of(context).pushReplacement(
              HomePage.route(),
            );
          }
        },
        builder: (context, state) {
          if (state.status == LoginStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == LoginStatus.logout) {
            return const LoginPageView();
          }
          return Container();
        },
      ),
    );
  }
}

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.read<LoginBloc>().add(const GoogleLoginRequested());
        },
        child: const Text("SIGN IN"),
      ),
    );
  }
}
