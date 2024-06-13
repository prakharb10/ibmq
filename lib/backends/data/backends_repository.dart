import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/backends/model/backend.dart';
import 'package:ibmq/data/http_data_provider.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository for IBM Backends
class BackendsRepository {
  final HTTPDataProvider _httpDataProvider;

  BackendsRepository({required HTTPDataProvider httpDataProvider})
      : _httpDataProvider = httpDataProvider;

  /// Get all Backends/Systems
  ///
  /// Returns the IBM Backends if the request is successful, otherwise
  /// returns an error message.
  ///
  /// See [HTTPDataProvider.getBackends] for more details.
  TaskEither<String, IList<Backend>> getBackends() =>
      _httpDataProvider.getBackends().flatMap((r) => r
          .traverseIOEither((a) =>
              IOEither.tryCatch(() => Backend.fromJson(a), (error, stackTrace) {
                talker.handle(
                  error,
                  stackTrace,
                  'Failed to parse Backend',
                );
                return 'Failed to parse Backend';
              }))
          .flatMap(
            (r) => IOEither.right(r.toIList()),
          )
          .toTaskEither());
}
