part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

/// Event to log in a user
/// [token] is the token to log in with
class Login extends UserEvent {
  final String token;

  const Login(this.token);

  @override
  List<Object> get props => [token];
}

/// Event to log out a user
class Logout extends UserEvent {}

/// Event to get the user's profile
class GetProfile extends UserEvent {}
