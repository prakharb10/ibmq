part of 'user_info_cubit.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoadInProgress extends UserInfoState {}

/// State when the user's info is loaded
///
/// [user] is the user's info
final class UserInfoLoadSuccess extends UserInfoState {
  final User user;
  final String accessToken;

  const UserInfoLoadSuccess({
    required this.user,
    required this.accessToken,
  });

  @override
  List<Object> get props => [user];
}

/// State when the user's info fails to load
///
/// [message] is the error message
final class UserInfoLoadFailure extends UserInfoState {
  final String message;

  const UserInfoLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
