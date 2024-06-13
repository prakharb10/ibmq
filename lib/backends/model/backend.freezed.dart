// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Backend _$BackendFromJson(Map<String, dynamic> json) {
  return _Backend.fromJson(json);
}

/// @nodoc
mixin _$Backend {
  /// Whether the user has access to the backend
  bool get hasAccess => throw _privateConstructorUsedError;

  /// The backend name
  String get name => throw _privateConstructorUsedError;

  /// The backend's basis gates
  ///
  /// The basis gates are the gates that the backend supports.
  /// This is a list of strings, where each string is the name of a gate.
  IList<String> get basisGates => throw _privateConstructorUsedError;

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
  IList<IList<int>> get couplingMap => throw _privateConstructorUsedError;

  /// The backend version
  Option<String> get version => throw _privateConstructorUsedError;

  /// Total number of qubits
  ///
  /// This is the total number of qubits that the backend has.
  int get qubits => throw _privateConstructorUsedError;

  /// Whether the backend is a simulator
  ///
  /// This is true if the backend is a simulator, otherwise false.
  bool get isSimulator => throw _privateConstructorUsedError;

  /// The Quantum Volume of the backend
  ///
  /// The Quantum Volume is a measure of the computational power of a quantum computer.
  /// It is a non-negative integer.
  ///
  /// This is `None` if the backend does not have a Quantum Volume.
  Option<int> get quantumVolume => throw _privateConstructorUsedError;

  /// The backend performance
  ///
  /// See [Performance] for more information.
  Performance get performance => throw _privateConstructorUsedError;

  /// The backend processor type
  ///
  /// A record that contains the family and revision of the processor.
  ({String family, String revision}) get processorType =>
      throw _privateConstructorUsedError;

  /// The device status
  ({String message, bool state, String status}) get deviceStatus =>
      throw _privateConstructorUsedError;

  /// The device queue length
  ///
  /// This is the number of jobs in the queue for the backend.
  int get queueLength => throw _privateConstructorUsedError;

  /// Different types of inputs allowed by the backend
  ///
  /// This is a list of strings, where each string is the name of an input type.
  IList<String> get inputAllowed => throw _privateConstructorUsedError;

  /// Different features supported by the backend
  ///
  /// This is a list of strings, where each string is the name of a feature.
  IList<String> get supportedFeatures => throw _privateConstructorUsedError;

  /// Coordinates of the backend qubits
  ///
  /// This is a list of tuples, where each tuple is a pair of integers.
  /// Each tuple is the coordinates of a qubit on the backend.
  ///
  /// For example, `[[0, 0], [0, 1], [1, 0], [1, 1]]` means that there are 4 qubits
  /// on the backend, and the coordinates of the qubits are (0, 0), (0, 1), (1, 0), and (1, 1).
  IList<IList<int>> get coords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackendCopyWith<Backend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendCopyWith<$Res> {
  factory $BackendCopyWith(Backend value, $Res Function(Backend) then) =
      _$BackendCopyWithImpl<$Res, Backend>;
  @useResult
  $Res call(
      {bool hasAccess,
      String name,
      IList<String> basisGates,
      IList<IList<int>> couplingMap,
      Option<String> version,
      int qubits,
      bool isSimulator,
      Option<int> quantumVolume,
      Performance performance,
      ({String family, String revision}) processorType,
      ({String message, bool state, String status}) deviceStatus,
      int queueLength,
      IList<String> inputAllowed,
      IList<String> supportedFeatures,
      IList<IList<int>> coords});

  $PerformanceCopyWith<$Res> get performance;
}

/// @nodoc
class _$BackendCopyWithImpl<$Res, $Val extends Backend>
    implements $BackendCopyWith<$Res> {
  _$BackendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasAccess = null,
    Object? name = null,
    Object? basisGates = null,
    Object? couplingMap = null,
    Object? version = null,
    Object? qubits = null,
    Object? isSimulator = null,
    Object? quantumVolume = null,
    Object? performance = null,
    Object? processorType = null,
    Object? deviceStatus = null,
    Object? queueLength = null,
    Object? inputAllowed = null,
    Object? supportedFeatures = null,
    Object? coords = null,
  }) {
    return _then(_value.copyWith(
      hasAccess: null == hasAccess
          ? _value.hasAccess
          : hasAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      basisGates: null == basisGates
          ? _value.basisGates
          : basisGates // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      couplingMap: null == couplingMap
          ? _value.couplingMap
          : couplingMap // ignore: cast_nullable_to_non_nullable
              as IList<IList<int>>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      qubits: null == qubits
          ? _value.qubits
          : qubits // ignore: cast_nullable_to_non_nullable
              as int,
      isSimulator: null == isSimulator
          ? _value.isSimulator
          : isSimulator // ignore: cast_nullable_to_non_nullable
              as bool,
      quantumVolume: null == quantumVolume
          ? _value.quantumVolume
          : quantumVolume // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      performance: null == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as Performance,
      processorType: null == processorType
          ? _value.processorType
          : processorType // ignore: cast_nullable_to_non_nullable
              as ({String family, String revision}),
      deviceStatus: null == deviceStatus
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as ({String message, bool state, String status}),
      queueLength: null == queueLength
          ? _value.queueLength
          : queueLength // ignore: cast_nullable_to_non_nullable
              as int,
      inputAllowed: null == inputAllowed
          ? _value.inputAllowed
          : inputAllowed // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      supportedFeatures: null == supportedFeatures
          ? _value.supportedFeatures
          : supportedFeatures // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      coords: null == coords
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as IList<IList<int>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PerformanceCopyWith<$Res> get performance {
    return $PerformanceCopyWith<$Res>(_value.performance, (value) {
      return _then(_value.copyWith(performance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BackendImplCopyWith<$Res> implements $BackendCopyWith<$Res> {
  factory _$$BackendImplCopyWith(
          _$BackendImpl value, $Res Function(_$BackendImpl) then) =
      __$$BackendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasAccess,
      String name,
      IList<String> basisGates,
      IList<IList<int>> couplingMap,
      Option<String> version,
      int qubits,
      bool isSimulator,
      Option<int> quantumVolume,
      Performance performance,
      ({String family, String revision}) processorType,
      ({String message, bool state, String status}) deviceStatus,
      int queueLength,
      IList<String> inputAllowed,
      IList<String> supportedFeatures,
      IList<IList<int>> coords});

  @override
  $PerformanceCopyWith<$Res> get performance;
}

/// @nodoc
class __$$BackendImplCopyWithImpl<$Res>
    extends _$BackendCopyWithImpl<$Res, _$BackendImpl>
    implements _$$BackendImplCopyWith<$Res> {
  __$$BackendImplCopyWithImpl(
      _$BackendImpl _value, $Res Function(_$BackendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasAccess = null,
    Object? name = null,
    Object? basisGates = null,
    Object? couplingMap = null,
    Object? version = null,
    Object? qubits = null,
    Object? isSimulator = null,
    Object? quantumVolume = null,
    Object? performance = null,
    Object? processorType = null,
    Object? deviceStatus = null,
    Object? queueLength = null,
    Object? inputAllowed = null,
    Object? supportedFeatures = null,
    Object? coords = null,
  }) {
    return _then(_$BackendImpl(
      hasAccess: null == hasAccess
          ? _value.hasAccess
          : hasAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      basisGates: null == basisGates
          ? _value.basisGates
          : basisGates // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      couplingMap: null == couplingMap
          ? _value.couplingMap
          : couplingMap // ignore: cast_nullable_to_non_nullable
              as IList<IList<int>>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      qubits: null == qubits
          ? _value.qubits
          : qubits // ignore: cast_nullable_to_non_nullable
              as int,
      isSimulator: null == isSimulator
          ? _value.isSimulator
          : isSimulator // ignore: cast_nullable_to_non_nullable
              as bool,
      quantumVolume: null == quantumVolume
          ? _value.quantumVolume
          : quantumVolume // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      performance: null == performance
          ? _value.performance
          : performance // ignore: cast_nullable_to_non_nullable
              as Performance,
      processorType: null == processorType
          ? _value.processorType
          : processorType // ignore: cast_nullable_to_non_nullable
              as ({String family, String revision}),
      deviceStatus: null == deviceStatus
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as ({String message, bool state, String status}),
      queueLength: null == queueLength
          ? _value.queueLength
          : queueLength // ignore: cast_nullable_to_non_nullable
              as int,
      inputAllowed: null == inputAllowed
          ? _value.inputAllowed
          : inputAllowed // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      supportedFeatures: null == supportedFeatures
          ? _value.supportedFeatures
          : supportedFeatures // ignore: cast_nullable_to_non_nullable
              as IList<String>,
      coords: null == coords
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as IList<IList<int>>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$BackendImpl extends _Backend {
  const _$BackendImpl(
      {required this.hasAccess,
      required this.name,
      required this.basisGates,
      required this.couplingMap,
      required this.version,
      required this.qubits,
      required this.isSimulator,
      required this.quantumVolume,
      required this.performance,
      required this.processorType,
      required this.deviceStatus,
      required this.queueLength,
      required this.inputAllowed,
      required this.supportedFeatures,
      required this.coords})
      : super._();

  factory _$BackendImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendImplFromJson(json);

  /// Whether the user has access to the backend
  @override
  final bool hasAccess;

  /// The backend name
  @override
  final String name;

  /// The backend's basis gates
  ///
  /// The basis gates are the gates that the backend supports.
  /// This is a list of strings, where each string is the name of a gate.
  @override
  final IList<String> basisGates;

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
  @override
  final IList<IList<int>> couplingMap;

  /// The backend version
  @override
  final Option<String> version;

  /// Total number of qubits
  ///
  /// This is the total number of qubits that the backend has.
  @override
  final int qubits;

  /// Whether the backend is a simulator
  ///
  /// This is true if the backend is a simulator, otherwise false.
  @override
  final bool isSimulator;

  /// The Quantum Volume of the backend
  ///
  /// The Quantum Volume is a measure of the computational power of a quantum computer.
  /// It is a non-negative integer.
  ///
  /// This is `None` if the backend does not have a Quantum Volume.
  @override
  final Option<int> quantumVolume;

  /// The backend performance
  ///
  /// See [Performance] for more information.
  @override
  final Performance performance;

  /// The backend processor type
  ///
  /// A record that contains the family and revision of the processor.
  @override
  final ({String family, String revision}) processorType;

  /// The device status
  @override
  final ({String message, bool state, String status}) deviceStatus;

  /// The device queue length
  ///
  /// This is the number of jobs in the queue for the backend.
  @override
  final int queueLength;

  /// Different types of inputs allowed by the backend
  ///
  /// This is a list of strings, where each string is the name of an input type.
  @override
  final IList<String> inputAllowed;

  /// Different features supported by the backend
  ///
  /// This is a list of strings, where each string is the name of a feature.
  @override
  final IList<String> supportedFeatures;

  /// Coordinates of the backend qubits
  ///
  /// This is a list of tuples, where each tuple is a pair of integers.
  /// Each tuple is the coordinates of a qubit on the backend.
  ///
  /// For example, `[[0, 0], [0, 1], [1, 0], [1, 1]]` means that there are 4 qubits
  /// on the backend, and the coordinates of the qubits are (0, 0), (0, 1), (1, 0), and (1, 1).
  @override
  final IList<IList<int>> coords;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendImplCopyWith<_$BackendImpl> get copyWith =>
      __$$BackendImplCopyWithImpl<_$BackendImpl>(this, _$identity);
}

abstract class _Backend extends Backend {
  const factory _Backend(
      {required final bool hasAccess,
      required final String name,
      required final IList<String> basisGates,
      required final IList<IList<int>> couplingMap,
      required final Option<String> version,
      required final int qubits,
      required final bool isSimulator,
      required final Option<int> quantumVolume,
      required final Performance performance,
      required final ({String family, String revision}) processorType,
      required final ({String message, bool state, String status}) deviceStatus,
      required final int queueLength,
      required final IList<String> inputAllowed,
      required final IList<String> supportedFeatures,
      required final IList<IList<int>> coords}) = _$BackendImpl;
  const _Backend._() : super._();

  factory _Backend.fromJson(Map<String, dynamic> json) = _$BackendImpl.fromJson;

  @override

  /// Whether the user has access to the backend
  bool get hasAccess;
  @override

  /// The backend name
  String get name;
  @override

  /// The backend's basis gates
  ///
  /// The basis gates are the gates that the backend supports.
  /// This is a list of strings, where each string is the name of a gate.
  IList<String> get basisGates;
  @override

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
  IList<IList<int>> get couplingMap;
  @override

  /// The backend version
  Option<String> get version;
  @override

  /// Total number of qubits
  ///
  /// This is the total number of qubits that the backend has.
  int get qubits;
  @override

  /// Whether the backend is a simulator
  ///
  /// This is true if the backend is a simulator, otherwise false.
  bool get isSimulator;
  @override

  /// The Quantum Volume of the backend
  ///
  /// The Quantum Volume is a measure of the computational power of a quantum computer.
  /// It is a non-negative integer.
  ///
  /// This is `None` if the backend does not have a Quantum Volume.
  Option<int> get quantumVolume;
  @override

  /// The backend performance
  ///
  /// See [Performance] for more information.
  Performance get performance;
  @override

  /// The backend processor type
  ///
  /// A record that contains the family and revision of the processor.
  ({String family, String revision}) get processorType;
  @override

  /// The device status
  ({String message, bool state, String status}) get deviceStatus;
  @override

  /// The device queue length
  ///
  /// This is the number of jobs in the queue for the backend.
  int get queueLength;
  @override

  /// Different types of inputs allowed by the backend
  ///
  /// This is a list of strings, where each string is the name of an input type.
  IList<String> get inputAllowed;
  @override

  /// Different features supported by the backend
  ///
  /// This is a list of strings, where each string is the name of a feature.
  IList<String> get supportedFeatures;
  @override

  /// Coordinates of the backend qubits
  ///
  /// This is a list of tuples, where each tuple is a pair of integers.
  /// Each tuple is the coordinates of a qubit on the backend.
  ///
  /// For example, `[[0, 0], [0, 1], [1, 0], [1, 1]]` means that there are 4 qubits
  /// on the backend, and the coordinates of the qubits are (0, 0), (0, 1), (1, 0), and (1, 1).
  IList<IList<int>> get coords;
  @override
  @JsonKey(ignore: true)
  _$$BackendImplCopyWith<_$BackendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
