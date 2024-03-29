import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/user/usage/model/user_usage.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository for user instances
class InstancesRepository {
  final RuntimeDataProvider _runtimeDataProvider;

  InstancesRepository({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider;

  /// Load the user instances
  ///
  /// Returns the user instances if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, IList<({String name, IBMQPlan plan})>>
      getUserInstances() => _runtimeDataProvider.getUserInstances().flatMap(
            (r) => r
                .traverseIOEither(
                  (a) => IOEither.tryCatch(
                      () => (
                            name: switch (Option<String>.safeCast(a['name'])) {
                              Some(value: final d) => d,
                              None() => throw Exception(
                                  'Failed to parse instance name'),
                            },
                            plan: IBMQPlan.values.byName(a['plan'])
                          ), (error, stackTrace) {
                    talker.handle(
                        error, stackTrace, 'Failed to parse instances');
                    return "Error while parsing instances";
                  }),
                )
                .map((r) => r.toIList())
                .toTaskEither(),
          );

  /// Load the instance usage information for the user
  ///
  /// Returns the instance usage information if the instance usage information
  /// is loaded successfully, otherwise returns `None`.
  TaskEither<String, UserUsage> loadUserUsage() =>
      _runtimeDataProvider.getUsage().flatMap(
            (r) => IOEither.tryCatch(
              () => UserUsage.fromJson(r),
              (error, stackTrace) {
                talker.handle(
                    error, stackTrace, 'Failed to parse UserUsage data');
                return 'Failed to parse UserUsage data';
              },
            ).toTaskEither(),
          );
}

enum IBMQPlan {
  open,
  premium,
  internal,
}
