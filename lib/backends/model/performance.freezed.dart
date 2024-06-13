// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Performance _$PerformanceFromJson(Map<String, dynamic> json) {
  return _Performance.fromJson(json);
}

/// @nodoc
mixin _$Performance {
  /// Hardware aware CLOPS
  Option<int> get clopsH => throw _privateConstructorUsedError;

  /// Virtual CLOPS
  Option<int> get clopsV => throw _privateConstructorUsedError;

  /// Layer fidelity values
  ///
  /// Layer fidelity is a measure of the fidelity of the gates in a quantum circuit.
  /// It is a list of [LayerFidelity] objects.
  IList<LayerFidelity> get layerFidelity => throw _privateConstructorUsedError;

  /// Error per layered gate
  double get eplg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PerformanceCopyWith<Performance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceCopyWith<$Res> {
  factory $PerformanceCopyWith(
          Performance value, $Res Function(Performance) then) =
      _$PerformanceCopyWithImpl<$Res, Performance>;
  @useResult
  $Res call(
      {Option<int> clopsH,
      Option<int> clopsV,
      IList<LayerFidelity> layerFidelity,
      double eplg});
}

/// @nodoc
class _$PerformanceCopyWithImpl<$Res, $Val extends Performance>
    implements $PerformanceCopyWith<$Res> {
  _$PerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clopsH = null,
    Object? clopsV = null,
    Object? layerFidelity = null,
    Object? eplg = null,
  }) {
    return _then(_value.copyWith(
      clopsH: null == clopsH
          ? _value.clopsH
          : clopsH // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      clopsV: null == clopsV
          ? _value.clopsV
          : clopsV // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      layerFidelity: null == layerFidelity
          ? _value.layerFidelity
          : layerFidelity // ignore: cast_nullable_to_non_nullable
              as IList<LayerFidelity>,
      eplg: null == eplg
          ? _value.eplg
          : eplg // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceImplCopyWith<$Res>
    implements $PerformanceCopyWith<$Res> {
  factory _$$PerformanceImplCopyWith(
          _$PerformanceImpl value, $Res Function(_$PerformanceImpl) then) =
      __$$PerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<int> clopsH,
      Option<int> clopsV,
      IList<LayerFidelity> layerFidelity,
      double eplg});
}

/// @nodoc
class __$$PerformanceImplCopyWithImpl<$Res>
    extends _$PerformanceCopyWithImpl<$Res, _$PerformanceImpl>
    implements _$$PerformanceImplCopyWith<$Res> {
  __$$PerformanceImplCopyWithImpl(
      _$PerformanceImpl _value, $Res Function(_$PerformanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clopsH = null,
    Object? clopsV = null,
    Object? layerFidelity = null,
    Object? eplg = null,
  }) {
    return _then(_$PerformanceImpl(
      clopsH: null == clopsH
          ? _value.clopsH
          : clopsH // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      clopsV: null == clopsV
          ? _value.clopsV
          : clopsV // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      layerFidelity: null == layerFidelity
          ? _value.layerFidelity
          : layerFidelity // ignore: cast_nullable_to_non_nullable
              as IList<LayerFidelity>,
      eplg: null == eplg
          ? _value.eplg
          : eplg // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PerformanceImpl extends _Performance {
  const _$PerformanceImpl(
      {required this.clopsH,
      required this.clopsV,
      required this.layerFidelity,
      required this.eplg})
      : super._();

  factory _$PerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceImplFromJson(json);

  /// Hardware aware CLOPS
  @override
  final Option<int> clopsH;

  /// Virtual CLOPS
  @override
  final Option<int> clopsV;

  /// Layer fidelity values
  ///
  /// Layer fidelity is a measure of the fidelity of the gates in a quantum circuit.
  /// It is a list of [LayerFidelity] objects.
  @override
  final IList<LayerFidelity> layerFidelity;

  /// Error per layered gate
  @override
  final double eplg;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceImplCopyWith<_$PerformanceImpl> get copyWith =>
      __$$PerformanceImplCopyWithImpl<_$PerformanceImpl>(this, _$identity);
}

abstract class _Performance extends Performance {
  const factory _Performance(
      {required final Option<int> clopsH,
      required final Option<int> clopsV,
      required final IList<LayerFidelity> layerFidelity,
      required final double eplg}) = _$PerformanceImpl;
  const _Performance._() : super._();

  factory _Performance.fromJson(Map<String, dynamic> json) =
      _$PerformanceImpl.fromJson;

  @override

  /// Hardware aware CLOPS
  Option<int> get clopsH;
  @override

  /// Virtual CLOPS
  Option<int> get clopsV;
  @override

  /// Layer fidelity values
  ///
  /// Layer fidelity is a measure of the fidelity of the gates in a quantum circuit.
  /// It is a list of [LayerFidelity] objects.
  IList<LayerFidelity> get layerFidelity;
  @override

  /// Error per layered gate
  double get eplg;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceImplCopyWith<_$PerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LayerFidelity _$LayerFidelityFromJson(Map<String, dynamic> json) {
  return _LayerFidelity.fromJson(json);
}

/// @nodoc
mixin _$LayerFidelity {
  /// Date of the measurement
  DateTime get date => throw _privateConstructorUsedError;

  /// Name of the measure
  String get name => throw _privateConstructorUsedError;

  /// Unit of the measure
  String get unit => throw _privateConstructorUsedError;

  /// Value of the measure
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LayerFidelityCopyWith<LayerFidelity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayerFidelityCopyWith<$Res> {
  factory $LayerFidelityCopyWith(
          LayerFidelity value, $Res Function(LayerFidelity) then) =
      _$LayerFidelityCopyWithImpl<$Res, LayerFidelity>;
  @useResult
  $Res call({DateTime date, String name, String unit, double value});
}

/// @nodoc
class _$LayerFidelityCopyWithImpl<$Res, $Val extends LayerFidelity>
    implements $LayerFidelityCopyWith<$Res> {
  _$LayerFidelityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LayerFidelityImplCopyWith<$Res>
    implements $LayerFidelityCopyWith<$Res> {
  factory _$$LayerFidelityImplCopyWith(
          _$LayerFidelityImpl value, $Res Function(_$LayerFidelityImpl) then) =
      __$$LayerFidelityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String name, String unit, double value});
}

/// @nodoc
class __$$LayerFidelityImplCopyWithImpl<$Res>
    extends _$LayerFidelityCopyWithImpl<$Res, _$LayerFidelityImpl>
    implements _$$LayerFidelityImplCopyWith<$Res> {
  __$$LayerFidelityImplCopyWithImpl(
      _$LayerFidelityImpl _value, $Res Function(_$LayerFidelityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? name = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_$LayerFidelityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$LayerFidelityImpl extends _LayerFidelity {
  const _$LayerFidelityImpl(
      {required this.date,
      required this.name,
      required this.unit,
      required this.value})
      : super._();

  factory _$LayerFidelityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LayerFidelityImplFromJson(json);

  /// Date of the measurement
  @override
  final DateTime date;

  /// Name of the measure
  @override
  final String name;

  /// Unit of the measure
  @override
  final String unit;

  /// Value of the measure
  @override
  final double value;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LayerFidelityImplCopyWith<_$LayerFidelityImpl> get copyWith =>
      __$$LayerFidelityImplCopyWithImpl<_$LayerFidelityImpl>(this, _$identity);
}

abstract class _LayerFidelity extends LayerFidelity {
  const factory _LayerFidelity(
      {required final DateTime date,
      required final String name,
      required final String unit,
      required final double value}) = _$LayerFidelityImpl;
  const _LayerFidelity._() : super._();

  factory _LayerFidelity.fromJson(Map<String, dynamic> json) =
      _$LayerFidelityImpl.fromJson;

  @override

  /// Date of the measurement
  DateTime get date;
  @override

  /// Name of the measure
  String get name;
  @override

  /// Unit of the measure
  String get unit;
  @override

  /// Value of the measure
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$LayerFidelityImplCopyWith<_$LayerFidelityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
