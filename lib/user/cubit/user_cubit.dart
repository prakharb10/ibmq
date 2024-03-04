import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/user/user_repository.dart';
import 'package:logger/logger.dart';

import '../model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  final _logger = Logger();
  UserCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial());

  /// Load the user's information
  ///
  /// Emits a [UserInfoLoadInProgress] state while the user's information is being
  /// loaded. If the user's information is loaded successfully, emits a
  /// [UserInfoLoadSuccess] state with the user's information. If the user's
  /// information fails to load, emits a [UserInfoLoadFailure] state with the error
  /// message.
  void loadUserInfo(String accessToken) async {
    emit(UserInfoLoadInProgress());
    switch (await _userRepository.loadUserInfo(accessToken).run()) {
      case Left(value: final l):
        _logger.e('Failed to load user info', error: l);
        emit(UserInfoLoadFailure(l));
        break;
      case Right(value: final r):
        emit(UserInfoLoadSuccess(accessToken: accessToken, user: r));
        break;
      default:
    }
  }
}
