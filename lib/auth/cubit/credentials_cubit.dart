import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/auth/data/creds_repository.dart';

part 'credentials_state.dart';

class CredentialsCubit extends Cubit<CredentialsState> {
  final CredsRepository _credsRepository;
  CredentialsCubit(CredsRepository credsRepository)
      : _credsRepository = credsRepository,
        super(CredentialsInitial());

  /// Load the user's credentials
  ///
  /// If the credentials are loaded successfully, emits a
  /// [CredentialsLoadSuccess] state with the user's token and access token, if
  /// saved. If the credentials load fails, emits a [CredentialsLoadFailure]
  /// state with the error message.
  void loadCredentials() async {
    try {
      final (:token, :accessToken) = await _credsRepository.getCredentials();
      emit(CredentialsLoadSuccess(token: token, accessToken: accessToken));
    } catch (e) {
      emit(const CredentialsLoadFailure('Failed to load credentials'));
    }
  }

  /// Delete the user's credentials
  ///
  /// Emits a [CredentialsDeleteInProgress] state while the credentials are being
  /// deleted. If the credentials are deleted successfully, emits a
  /// [CredentialsDeleteSuccess] state. If the credentials delete fails, emits a
  /// [CredentialsDeleteFailure] state with the error message.
  void deleteCredentials() async {
    emit(CredentialsDeleteInProgress());
    try {
      await _credsRepository.deleteCredentials();
      emit(CredentialsDeleteSuccess());
    } catch (e) {
      emit(const CredentialsDeleteFailure('Failed to delete credentials'));
    }
  }
}
