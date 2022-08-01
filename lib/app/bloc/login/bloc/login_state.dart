part of 'login_bloc.dart';

enum LoginStatus {
  logout,
  login,
  loading,
  fail,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.logout,
    this.account,
  });
  final GoogleSignInAccount? account;
  final LoginStatus status;

  LoginState copyWith({
    LoginStatus? status,

    /// probably need to clean this
    GoogleSignInAccount? account,
  }) {
    return LoginState(
      status: status ?? this.status,
      account: account ?? this.account,
    );
  }

  @override
  List<Object?> get props => [account.toString(), status];
}
