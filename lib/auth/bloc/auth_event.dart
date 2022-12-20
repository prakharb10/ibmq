part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event to log in a user
///
/// [token] is the token to log in with
class Login extends AuthEvent {
  final String token;

  const Login(this.token);

  @override
  List<Object> get props => [token];
}

/// Event to log out a user
class Logout extends AuthEvent {}
