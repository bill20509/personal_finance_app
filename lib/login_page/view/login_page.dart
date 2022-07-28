import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_app/home/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepository _authRepository = AuthRepository();
    return FutureBuilder(
      future: _authRepository.signInWithGoogleCheck(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == false) {
          return LoginPageView();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == true) {
          return const HomePage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class LoginPageView extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();

  LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Container(
        child: Center(
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
        ),
      ),
    );
  }
}
