import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/backends/model/performance.dart';

part 'backend.freezed.dart';
part 'backend.g.dart';

/// Backend model
///
/// Contains all information about a backend.
///
/// Some fields are omitted for brevity.
@Freezed(toJson: false)
class Backend extends Equatable with _$Backend {
  const factory Backend({
    /// Whether the user has access to the backend
    required bool hasAccess,

    /// The backend name
    required String name,

    /// The backend's basis gates
    ///
    /// The basis gates are the gates that the backend supports.
    /// This is a list of strings, where each string is the name of a gate.
    required IList<String> basisGates,

    /// The coupling map of the backend
    ///
    /// The coupling map is a list of tuples, where each tuple is a pair of qubits
    /// that are connected.
    /// This is a list of lists of integers, where each list of integers is a tuple.
    ///
    /// For example, `[[0, 1], [1, 2]]` means that qubit 0 is connected to qubit 1,
    /// and qubit 1 is connected to qubit 2.
    ///
    /// This is an empty list if the backend does not have a coupling map.
    /// If the backend is a simulator, this is an empty list.
    /// If the backend is a real quantum computer, this is a list of tuples.
    required IList<IList<int>> couplingMap,

    /// The backend version
    required Option<String> version,

    /// Total number of qubits
    ///
    /// This is the total number of qubits that the backend has.
    required int qubits,

    /// Whether the backend is a simulator
    ///
    /// This is true if the backend is a simulator, otherwise false.
    required bool isSimulator,

    /// The Quantum Volume of the backend
    ///
    /// The Quantum Volume is a measure of the computational power of a quantum computer.
    /// It is a non-negative integer.
    ///
    /// This is `None` if the backend does not have a Quantum Volume.
    required Option<int> quantumVolume,

    /// The backend performance
    ///
    /// See [Performance] for more information.
    required Performance performance,

    /// The backend processor type
    ///
    /// A record that contains the family and revision of the processor.
    required ({
      String family,
      String revision,
    }) processorType,

    /// The device status
    required ({
      bool state,
      String status,
      String message,
    }) deviceStatus,

    /// The device queue length
    ///
    /// This is the number of jobs in the queue for the backend.
    required int queueLength,

    /// Different types of inputs allowed by the backend
    ///
    /// This is a list of strings, where each string is the name of an input type.
    required IList<String> inputAllowed,

    /// Different features supported by the backend
    ///
    /// This is a list of strings, where each string is the name of a feature.
    required IList<String> supportedFeatures,

    /// Coordinates of the backend qubits
    ///
    /// This is a list of tuples, where each tuple is a pair of integers.
    /// Each tuple is the coordinates of a qubit on the backend.
    ///
    /// For example, `[[0, 0], [0, 1], [1, 0], [1, 1]]` means that there are 4 qubits
    /// on the backend, and the coordinates of the qubits are (0, 0), (0, 1), (1, 0), and (1, 1).
    required IList<IList<int>> coords,
  }) = _Backend;

  const Backend._();

  factory Backend.fromJson(Map<String, dynamic> json) =>
      _$BackendFromJson(json);

  @override
  List<Object> get props => [
        hasAccess,
        name,
        basisGates,
        couplingMap,
        version,
        qubits,
        isSimulator,
        quantumVolume,
        performance,
        processorType,
        deviceStatus,
        queueLength,
        inputAllowed,
        supportedFeatures,
        coords,
      ];
}
