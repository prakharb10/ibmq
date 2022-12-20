import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/auth/data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<Login>((event, emit) async {
      try {
        emit(AuthLoading());
        final cookie = await _authRepository.tokenLogin(event.token);
        emit(Authenticated(cookie));
      } catch (e) {
        log(e.toString());
        emit(AuthError());
      }
    });
  }
}
