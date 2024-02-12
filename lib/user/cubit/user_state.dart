part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserInfoLoadInProgress extends UserState {}

/// State when the user's info is loaded
///
/// [user] is the user's info
final class UserInfoLoadSuccess extends UserState {
  final User user;

  const UserInfoLoadSuccess(this.user);

  @override
  List<Object> get props => [user];
}

/// State when the user's info fails to load
///
/// [message] is the error message
final class UserInfoLoadFailure extends UserState {
  final String message;

  const UserInfoLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
