import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/auth/data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(AuthInitial());

  /// Log in a user with a token
  ///
  /// Emits a [TokenLoginInProgress] state while the login is in progress. If the
  /// login is successful, emits a [TokenLoginSuccess] state with the user's token
  /// and access token. If the login fails, emits a [TokenLoginFailure] state with
  /// the error message.
  void tokenLogin(String token) async {
    emit(TokenLoginInProgress());
    try {
      final accessToken = await _authRepository.tokenLogin(token);
      emit(TokenLoginSuccess(accessToken: accessToken));
    } catch (e) {
      emit(TokenLoginFailure(e.toString()));
    }
  }
}
