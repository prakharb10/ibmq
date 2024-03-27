import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/user/user_repository.dart';
import 'package:ibmq/utils/talker.dart';

import '../model/user.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserRepository _userRepository;
  UserInfoCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInfoInitial());

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
        talker.error('Failed to load user info', l);
        emit(UserInfoLoadFailure(l));
        break;
      case Right(value: final r):
        emit(UserInfoLoadSuccess(accessToken: accessToken, user: r));
        break;
      default:
        emit(const UserInfoLoadFailure('Failed to load user info'));
        break;
    }
  }
}
