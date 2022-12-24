part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsInitial extends JobsState {}

/// State for jobs loading
class JobsLoading extends JobsState {}

/// State for jobs loaded
///
/// * [skip] is the number of jobs skipped
/// * [limit] is the number of jobs returned
/// * [count] is the total number of jobs
/// * [items] is the list of jobs
@JsonSerializable()
class JobsLoaded extends JobsState {
  @JsonKey(readValue: _readMeta)
  final int skip;
  @JsonKey(readValue: _readMeta)
  final int limit;
  @JsonKey(readValue: _readMeta)
  final int count;
  final List<Job> items;

  const JobsLoaded({
    required this.skip,
    required this.limit,
    required this.count,
    required this.items,
  });

  @override
  List<Object> get props => [skip, limit, count, items];

  static _readMeta(Map<dynamic, dynamic> json, String key) {
    return json['meta'][key];
  }

  factory JobsLoaded.fromJson(Map<String, dynamic> json) =>
      _$JobsLoadedFromJson(json);

  Map<String, dynamic> toJson() => _$JobsLoadedToJson(this);
}

/// State for jobs error
///
/// [message] is the error message
class JobsError extends JobsState {
  final String message;

  const JobsError({required this.message});

  @override
  List<Object> get props => [message];
}
