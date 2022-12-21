import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/user/data/user_repository.dart';

import '../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository = UserRepository();
  UserBloc() : super(UserInitial()) {
    on<Login>((event, emit) async {
      emit(UserLoading());
      try {
        final cookie = await _userRepository.tokenLogin(event.token);
        emit(UserLoggedIn(cookie));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<GetProfile>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await _userRepository.getProfile();
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
