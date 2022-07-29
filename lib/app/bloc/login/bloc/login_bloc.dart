import 'package:auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
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
    on<GoogleLoginRequested>(onGoogleLoginRequested);
    on<LogoutRequested>(onLogoutRequested);
  }
  final AuthRepository _authRepository;

  Future<void> onLoginStateRequested(
    LoginStateRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final account = _authRepository.googleAccount();
      if (account != null) {
        emit(state.copyWith(status: LoginStatus.login, account: account));
      } else {
        emit(state.copyWith(status: LoginStatus.logout));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.fail));
    }
  }

  Future<void> onGoogleLoginRequested(
    GoogleLoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final check = await _authRepository.signInWithGoogle();
      final account = _authRepository.googleAccount();
      if (check) {
        emit(
          state.copyWith(
            status: LoginStatus.login,
            account: account,
          ),
        );
      } else {
        emit(state.copyWith(status: LoginStatus.logout));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.fail));
    }
  }

  Future<void> onLogoutRequested(
      LogoutRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authRepository.signOut();
      emit(state.copyWith(status: LoginStatus.logout));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.fail));
    }
  }
}
