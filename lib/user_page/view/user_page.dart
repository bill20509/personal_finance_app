import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authRepository = AuthRepository();
    final user = _authRepository.googleAccount();
    return FutureBuilder(
      future: _authRepository.googleAccount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data! as GoogleSignInAccount;
          return Center(
            child: Column(
              children: [
                Text(data.email),
                Text(data.id),
                if (data.photoUrl != null) Text(data.photoUrl!),
                if (data.displayName != null) Text(data.displayName!),
                Text(data.toString()),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
