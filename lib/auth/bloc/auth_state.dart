part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

/// State when a user is logged in
class Authenticated extends AuthState {
  /// Cookie to use for authenticated requests
  final Cookie cookie;

  const Authenticated(this.cookie);

  @override
  List<Object> get props => [cookie];
}

/// State when loading a user
class AuthLoading extends AuthState {}

/// State when error occurs
class AuthError extends AuthState {}
