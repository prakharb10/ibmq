import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/hgp/hgp_repository.dart';
import 'package:ibmq/hgp/model/hub.dart';
import 'package:logger/logger.dart';

part 'hgp_state.dart';

final logger = Logger();

class HgpCubit extends Cubit<HgpState> {
  final HGPRepository _hgpRepository;
  final _logger = Logger();
  HgpCubit({required HGPRepository hgpRepository})
      : _hgpRepository = hgpRepository,
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
    switch (await _hgpRepository.loadHGP().run()) {
      case Left(value: final l):
        _logger.e('Failed to load HGP', error: l);
        emit(HgpLoadFailure(l));
        break;
      case Right(value: final r):
        emit(HgpLoadSuccess(r.toIList()));
        break;
      default:
    }
  }
}
