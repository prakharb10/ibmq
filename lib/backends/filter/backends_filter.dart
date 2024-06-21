import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backends_filter.freezed.dart';

@freezed
class BackendsFilter with _$BackendsFilter {
  factory BackendsFilter({
    @Default(None()) Option<int> sortColumn,
    @Default(true) bool sortAscending,
    @Default(None()) Option<String> search,
    @Default(None()) Option<List<String>> features,
  }) = _BackendsFilter;
}
