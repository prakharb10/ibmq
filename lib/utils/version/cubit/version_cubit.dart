import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/data/auth_client.dart';

part 'version_state.dart';

// TODO: Switch to hydrated_cubit
class VersionCubit extends Cubit<VersionState> {
  final AuthClient _authClient;
  VersionCubit(AuthClient authClient)
      : _authClient = authClient,
        super(VersionInitial());

  /// Get the version of the API
  Future<void> getVersion() async {
    emit(VersionLoadInProgress());
    try {
      final response = await _authClient.getVersion();
      switch (response.data) {
        case {"version": var version}:
          emit(VersionLoadSuccess(version));
          break;
        default:
          emit(const VersionLoadFailure("Failed to get version"));
      }
    } on Exception catch (e) {
      emit(VersionLoadFailure(e.toString()));
    }
  }
}
