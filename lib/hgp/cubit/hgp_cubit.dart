import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibmq/data/http_client.dart';
import 'package:ibmq/hgp/model/hub.dart';
import 'package:logger/logger.dart';

part 'hgp_state.dart';

final logger = Logger();

class HgpCubit extends Cubit<HgpState> {
  final HttpClient _httpClient;
  HgpCubit({required HttpClient httpClient})
      : _httpClient = httpClient,
        super(HgpInitial());

  /// Load the HGP information
  ///
  /// Emits a [HgpLoadInProgress] state while the HGP information is being
  /// loaded.
  ///
  /// If the HGP information is loaded successfully, emits a [HgpLoadSuccess]
  /// state with the HGP information.
  ///
  /// If the HGP information fails to load, emits a [HgpLoadFailure] state with
  /// the error message.
  void loadHgp() async {
    emit(HgpLoadInProgress());
    try {
      final hgps = await _httpClient.getHGPs();
      emit(HgpLoadSuccess(hgps));
    } catch (e) {
      logger.e('Failed to load HGP', error: e);
      emit(HgpLoadFailure(e.toString()));
    }
  }
}
