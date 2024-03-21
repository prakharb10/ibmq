import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/hive_data_provider.dart';
import 'package:ibmq/utils/talker.dart';

/// Repository to handle authentication
///
/// Currently, this checks if a cached token is available
/// and logs in the user if it is.
/// We should add support for multiple accounts later.
class CredsRepository {
  final HiveDataProvider _hiveDataProvider;

  CredsRepository({required HiveDataProvider hiveDataProvider})
      : _hiveDataProvider = hiveDataProvider;

  /// Fetches the token and the access token from the cache, if available.
  /// If not, it returns null.
  Future<({String? token, String? accessToken})> getCredentials() async {
    try {
      final box = _hiveDataProvider.getBox('ibmq').run().getOrElse(() {
        throw Exception('Box ibmq does not exist');
      });
      final token = await _hiveDataProvider.getValue<String>(box, 'token');
      final accessToken =
          await _hiveDataProvider.getValue<String>(box, 'accessToken');
      final expiresAt =
          await _hiveDataProvider.getValue<DateTime>(box, 'expiresAt');
      if (expiresAt != null && expiresAt.isBefore(DateTime.now())) {
        talker.warning('Token has expired');
        return (token: token, accessToken: null);
      }
      return (token: token, accessToken: accessToken);
    } catch (e) {
      talker.error('Failed to get credentials', e);
      return (token: null, accessToken: null);
    }
  }

  /// Deletes the token and the access token from the cache.
  ///
  /// Throws an exception if an error occurs.
  Future<void> deleteCredentials() async {
    try {
      final box = _hiveDataProvider.getBox('ibmq').run().getOrElse(() {
        throw Exception('Box ibmq does not exist');
      });
      _hiveDataProvider.deleteValue(box, 'token');
      _hiveDataProvider.deleteValue(box, 'accessToken');
      _hiveDataProvider.deleteValue(box, 'expiresAt');
    } catch (e) {
      talker.error('Failed to delete credentials', e);
      throw Exception('Failed to delete credentials');
    }
  }
}
