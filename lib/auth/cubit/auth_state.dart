part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class TokenLoginInProgress extends AuthState {}

/// State when the token login is successful
///
/// [accessToken] is the access token to use for Runtime API requests
final class TokenLoginSuccess extends AuthState {
  final String accessToken;

  const TokenLoginSuccess({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}

/// State when the token login fails
///
/// [message] is the error message
final class TokenLoginFailure extends AuthState {
  final String message;

  const TokenLoginFailure(this.message);

  @override
  List<Object> get props => [message];
}
