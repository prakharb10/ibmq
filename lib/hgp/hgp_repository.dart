import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/http_data_provider.dart';
import 'package:ibmq/hgp/model/hub.dart';

/// H/G/P Repository
class HGPRepository {
  final HTTPDataProvider _httpDataProvider;
  HGPRepository({required HTTPDataProvider httpDataProvider})
      : _httpDataProvider = httpDataProvider;

  /// Load the HGP information
  ///
  /// Returns the HGP information if the HGP information is loaded
  /// successfully, otherwise returns an error message.
  TaskEither<String, List<Hub>> loadHGP() => _httpDataProvider.getHGP().flatMap(
        (r) => TaskEither.fromOption(
          Option.fromJson(
              r,
              (json) => switch (Option<List>.safeCast(json)) {
                    Some(value: final d) =>
                      d.map((e) => Hub.fromJson(e)).toList(),
                    None() => throw Exception('Failed to parse H/G/P data'),
                  }),
          () => 'Failed to parse H/G/P data',
        ),
      );
}
