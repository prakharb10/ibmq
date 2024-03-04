import 'package:fpdart/fpdart.dart';
import 'package:ibmq/data/auth_data_provider.dart';
import 'package:ibmq/user/model/user.dart';

/// Repository for user data
class UserRepository {
  final AuthDataProvider _authDataProvider;
  UserRepository({required AuthDataProvider authDataProvider})
      : _authDataProvider = authDataProvider;

  /// Load the user's information
  ///
  /// Returns the user's information if the user's information is loaded
  /// successfully, otherwise returns `None`.
  TaskEither<String, User> loadUserInfo(String accessToken) =>
      _authDataProvider.getUser(accessToken).flatMap(
            (r) => TaskEither.fromOption(
              Option.fromJson(r, (json) => User.fromJson(json)),
              () => 'Failed to parse User data',
            ),
          );
}
