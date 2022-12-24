part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

/// State when a user is logged in
///
/// [cookie] is the cookie to use for authenticated requests
class UserLoggedIn extends UserState {
  final Cookie cookie;

  const UserLoggedIn(this.cookie);

  @override
  List<Object> get props => [cookie];
}

/// State when [User] data has been fetched
/// [user] is the user data
class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

/// State when loading user data
class UserLoading extends UserState {}

/// State when error occurs
/// [message] is the error message
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
