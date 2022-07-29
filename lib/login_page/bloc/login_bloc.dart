import 'package:auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginStateRequested>(onLoginStateRequested);
  }
  final AuthRepository _authRepository;

  Future<void> onLoginStateRequested(
    LoginStateRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final account = await _authRepository.googleAccount();
      if (account != null) {
        emit(state.copyWith(status: LoginStatus.login, account: account));
      } else {
        emit(state.copyWith(status: LoginStatus.logout));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.fail));
    }
  }
}
