// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backends_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackendsFilter {
  Option<int> get sortColumn => throw _privateConstructorUsedError;
  bool get sortAscending => throw _privateConstructorUsedError;
  Option<String> get search => throw _privateConstructorUsedError;
  Option<List<String>> get features => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackendsFilterCopyWith<BackendsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackendsFilterCopyWith<$Res> {
  factory $BackendsFilterCopyWith(
          BackendsFilter value, $Res Function(BackendsFilter) then) =
      _$BackendsFilterCopyWithImpl<$Res, BackendsFilter>;
  @useResult
  $Res call(
      {Option<int> sortColumn,
      bool sortAscending,
      Option<String> search,
      Option<List<String>> features});
}

/// @nodoc
class _$BackendsFilterCopyWithImpl<$Res, $Val extends BackendsFilter>
    implements $BackendsFilterCopyWith<$Res> {
  _$BackendsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortColumn = null,
    Object? sortAscending = null,
    Object? search = null,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      sortColumn: null == sortColumn
          ? _value.sortColumn
          : sortColumn // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Option<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackendsFilterImplCopyWith<$Res>
    implements $BackendsFilterCopyWith<$Res> {
  factory _$$BackendsFilterImplCopyWith(_$BackendsFilterImpl value,
          $Res Function(_$BackendsFilterImpl) then) =
      __$$BackendsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<int> sortColumn,
      bool sortAscending,
      Option<String> search,
      Option<List<String>> features});
}

/// @nodoc
class __$$BackendsFilterImplCopyWithImpl<$Res>
    extends _$BackendsFilterCopyWithImpl<$Res, _$BackendsFilterImpl>
    implements _$$BackendsFilterImplCopyWith<$Res> {
  __$$BackendsFilterImplCopyWithImpl(
      _$BackendsFilterImpl _value, $Res Function(_$BackendsFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortColumn = null,
    Object? sortAscending = null,
    Object? search = null,
    Object? features = null,
  }) {
    return _then(_$BackendsFilterImpl(
      sortColumn: null == sortColumn
          ? _value.sortColumn
          : sortColumn // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      sortAscending: null == sortAscending
          ? _value.sortAscending
          : sortAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as Option<List<String>>,
    ));
  }
}

/// @nodoc

class _$BackendsFilterImpl implements _BackendsFilter {
  _$BackendsFilterImpl(
      {this.sortColumn = const None(),
      this.sortAscending = true,
      this.search = const None(),
      this.features = const None()});

  @override
  @JsonKey()
  final Option<int> sortColumn;
  @override
  @JsonKey()
  final bool sortAscending;
  @override
  @JsonKey()
  final Option<String> search;
  @override
  @JsonKey()
  final Option<List<String>> features;

  @override
  String toString() {
    return 'BackendsFilter(sortColumn: $sortColumn, sortAscending: $sortAscending, search: $search, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackendsFilterImpl &&
            (identical(other.sortColumn, sortColumn) ||
                other.sortColumn == sortColumn) &&
            (identical(other.sortAscending, sortAscending) ||
                other.sortAscending == sortAscending) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.features, features) ||
                other.features == features));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sortColumn, sortAscending, search, features);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackendsFilterImplCopyWith<_$BackendsFilterImpl> get copyWith =>
      __$$BackendsFilterImplCopyWithImpl<_$BackendsFilterImpl>(
          this, _$identity);
}

abstract class _BackendsFilter implements BackendsFilter {
  factory _BackendsFilter(
      {final Option<int> sortColumn,
      final bool sortAscending,
      final Option<String> search,
      final Option<List<String>> features}) = _$BackendsFilterImpl;

  @override
  Option<int> get sortColumn;
  @override
  bool get sortAscending;
  @override
  Option<String> get search;
  @override
  Option<List<String>> get features;
  @override
  @JsonKey(ignore: true)
  _$$BackendsFilterImplCopyWith<_$BackendsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
