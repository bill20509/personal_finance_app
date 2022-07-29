part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginStateRequested extends LoginEvent {
  const LoginStateRequested();
}

class GoogleLoginRequested extends LoginEvent {
  const GoogleLoginRequested();
}

class LogoutRequested extends LoginEvent {
  const LogoutRequested();
}
