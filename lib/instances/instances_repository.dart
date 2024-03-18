import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:logger/logger.dart';

/// Repository for user instances
class InstancesRepository {
  final RuntimeDataProvider _runtimeDataProvider;
  final _logger = Logger();

  InstancesRepository({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider;

  /// Load the user instances
  ///
  /// Returns the user instances if the request is successful, otherwise
  /// returns an error message.
  TaskEither<String, IList<({String name, IBMQPlan plan})>>
      getUserInstances() => _runtimeDataProvider.getUserInstances().flatMap(
            (r) => r
                .traverseTaskEither(
                  (a) => TaskEither.fromOption(
                    Option.fromJson(
                      a,
                      (json) => (
                        name: switch (Option<String>.safeCast(json['name'])) {
                          Some(value: final d) => d,
                          None() =>
                            throw Exception('Failed to parse instance name'),
                        },
                        plan: IBMQPlan.values.byName(a['plan'])
                      ),
                    ),
                    () {
                      _logger.e('Failed to parse instance', error: a);
                      return "Error while parsing instances";
                    },
                  ),
                )
                .map((r) => r.toIList()),
          );
}

enum IBMQPlan {
  open,
  premium,
  internal,
}
