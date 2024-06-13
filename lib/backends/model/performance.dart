import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance.freezed.dart';
part 'performance.g.dart';

/// Backend performance model
@Freezed(toJson: false)
class Performance extends Equatable with _$Performance {
  const factory Performance({
    /// Hardware aware CLOPS
    required Option<int> clopsH,

    /// Virtual CLOPS
    required Option<int> clopsV,

    /// Layer fidelity values
    ///
    /// Layer fidelity is a measure of the fidelity of the gates in a quantum circuit.
    /// It is a list of [LayerFidelity] objects.
    required IList<LayerFidelity> layerFidelity,

    /// Error per layered gate
    required double eplg,
  }) = _Performance;

  const Performance._();

  factory Performance.fromJson(Map<String, dynamic> json) =>
      _$PerformanceFromJson(json);

  @override
  List<Object> get props => [clopsH, clopsV, layerFidelity, eplg];
}

/// Model for layer fidelity
@Freezed(toJson: false)
class LayerFidelity extends Equatable with _$LayerFidelity {
  const factory LayerFidelity({
    /// Date of the measurement
    required DateTime date,

    /// Name of the measure
    required String name,

    /// Unit of the measure
    required String unit,

    /// Value of the measure
    required double value,
  }) = _LayerFidelity;

  const LayerFidelity._();

  factory LayerFidelity.fromJson(Map<String, dynamic> json) =>
      _$LayerFidelityFromJson(json);

  @override
  List<Object> get props => [date, name, unit, value];
}
