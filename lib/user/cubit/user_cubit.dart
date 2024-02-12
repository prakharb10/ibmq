import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/data/auth_client.dart';

import '../model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthClient _authClient;
  UserCubit({required AuthClient authClient})
      : _authClient = authClient,
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
    try {
      final user = await _authClient.getUser(accessToken);
      emit(UserInfoLoadSuccess(user));
    } catch (e) {
      emit(UserInfoLoadFailure(e.toString()));
    }
  }
}
