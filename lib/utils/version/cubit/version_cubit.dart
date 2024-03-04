import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:logger/logger.dart';

part 'version_state.dart';

// TODO: Switch to hydrated_cubit
class VersionCubit extends Cubit<VersionState> {
  final AuthDataProvider _authDataProvider;
  final _logger = Logger();
  VersionCubit(AuthDataProvider authDataProvider)
      : _authDataProvider = authDataProvider,
        super(VersionInitial());

  /// Get the version of the API
  Future<void> getVersion() async {
    emit(VersionLoadInProgress());
    switch (await _authDataProvider.getVersion().run()) {
      case Left(value: final l):
        _logger.e('Failed to get version', error: l);
        emit(VersionLoadFailure(l));
        break;
      case Right(value: final r):
        switch (r) {
          case {"version": final version}:
            emit(VersionLoadSuccess(version));
            break;
          default:
            emit(const VersionLoadFailure("Failed to get version"));
        }
      default:
    }
  }
}
