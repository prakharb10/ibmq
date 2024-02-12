part of 'credentials_cubit.dart';

sealed class CredentialsState extends Equatable {
  const CredentialsState();

  @override
  List<Object?> get props => [];
}

final class CredentialsInitial extends CredentialsState {}

/// State when the credentials load is successful
///
/// [token] is the user's token, if saved
/// [accessToken] is the access token to use for Runtime API requests, if saved
/// and valid
final class CredentialsLoadSuccess extends CredentialsState {
  final String? token;
  final String? accessToken;

  const CredentialsLoadSuccess({
    this.token,
    this.accessToken,
  });

  @override
  List<Object?> get props => [token, accessToken];
}

/// State when the credentials load fails
///
/// [message] is the error message
final class CredentialsLoadFailure extends CredentialsState {
  final String message;

  const CredentialsLoadFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// State when the credentials are being deleted
final class CredentialsDeleteInProgress extends CredentialsState {}

/// State when the credentials are deleted
final class CredentialsDeleteSuccess extends CredentialsState {}

/// State when the credentials delete fails
///
/// [message] is the error message
final class CredentialsDeleteFailure extends CredentialsState {
  final String message;

  const CredentialsDeleteFailure(this.message);

  @override
  List<Object?> get props => [message];
}
