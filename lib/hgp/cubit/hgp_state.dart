part of 'hgp_cubit.dart';

sealed class HgpState extends Equatable {
  const HgpState();

  @override
  List<Object> get props => [];
}

final class HgpInitial extends HgpState {}

final class HgpLoadInProgress extends HgpState {}

/// State when the HGP is loaded
///
/// [hgps] is the list of Hub/Group/Project
final class HgpLoadSuccess extends HgpState {
  final List<Hub> hgps;

  const HgpLoadSuccess(this.hgps);

  @override
  List<Object> get props => [hgps];
}

/// State when the HGP fails to load
///
/// [message] is the error message
final class HgpLoadFailure extends HgpState {
  final String message;

  const HgpLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
