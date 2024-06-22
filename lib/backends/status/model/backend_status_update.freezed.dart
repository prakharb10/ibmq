// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend_status_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackendStatusUpdate _$BackendStatusUpdateFromJson(Map<String, dynamic> json) {
  return _BackendStatusUpdate.fromJson(json);
}

/// @nodoc
mixin _$BackendStatusUpdate {
  String get type => throw _privateConstructorUsedError;
  List<({int lengthQueue, String name})> get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BackendStatusUpdateCopyWith<BackendStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendStatusUpdateCopyWith<$Res> {
  factory $BackendStatusUpdateCopyWith(
          BackendStatusUpdate value, $Res Function(BackendStatusUpdate) then) =
      _$BackendStatusUpdateCopyWithImpl<$Res, BackendStatusUpdate>;
  @useResult
  $Res call({String type, List<({int lengthQueue, String name})> data});
}

/// @nodoc
class _$BackendStatusUpdateCopyWithImpl<$Res, $Val extends BackendStatusUpdate>
    implements $BackendStatusUpdateCopyWith<$Res> {
  _$BackendStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<({int lengthQueue, String name})>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackendStatusUpdateImplCopyWith<$Res>
    implements $BackendStatusUpdateCopyWith<$Res> {
  factory _$$BackendStatusUpdateImplCopyWith(_$BackendStatusUpdateImpl value,
          $Res Function(_$BackendStatusUpdateImpl) then) =
      __$$BackendStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<({int lengthQueue, String name})> data});
}

/// @nodoc
class __$$BackendStatusUpdateImplCopyWithImpl<$Res>
    extends _$BackendStatusUpdateCopyWithImpl<$Res, _$BackendStatusUpdateImpl>
    implements _$$BackendStatusUpdateImplCopyWith<$Res> {
  __$$BackendStatusUpdateImplCopyWithImpl(_$BackendStatusUpdateImpl _value,
      $Res Function(_$BackendStatusUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_$BackendStatusUpdateImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<({int lengthQueue, String name})>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackendStatusUpdateImpl implements _BackendStatusUpdate {
  _$BackendStatusUpdateImpl(
      {required this.type,
      required final List<({int lengthQueue, String name})> data})
      : _data = data;

  factory _$BackendStatusUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackendStatusUpdateImplFromJson(json);

  @override
  final String type;
  final List<({int lengthQueue, String name})> _data;
  @override
  List<({int lengthQueue, String name})> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BackendStatusUpdate(type: $type, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendStatusUpdateImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendStatusUpdateImplCopyWith<_$BackendStatusUpdateImpl> get copyWith =>
      __$$BackendStatusUpdateImplCopyWithImpl<_$BackendStatusUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackendStatusUpdateImplToJson(
      this,
    );
  }
}

abstract class _BackendStatusUpdate implements BackendStatusUpdate {
  factory _BackendStatusUpdate(
          {required final String type,
          required final List<({int lengthQueue, String name})> data}) =
      _$BackendStatusUpdateImpl;

  factory _BackendStatusUpdate.fromJson(Map<String, dynamic> json) =
      _$BackendStatusUpdateImpl.fromJson;

  @override
  String get type;
  @override
  List<({int lengthQueue, String name})> get data;
  @override
  @JsonKey(ignore: true)
  _$$BackendStatusUpdateImplCopyWith<_$BackendStatusUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
