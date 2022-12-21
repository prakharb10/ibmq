import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// The model for a user
///
/// NOTE: All fields are not parsed, only relevant
@JsonSerializable()
class User extends Equatable {
  /// The user's id
  final String id;

  /// The user's username
  final String username;

  /// The user's email
  final String email;

  /// The user's first name
  final String firstName;

  /// The user's last name
  final String lastName;

  /// The user's institution
  final String institution;

  /// The user's urls
  /// `http` is the base url for all API calls
  final Map<String, dynamic> urls;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.institution,
    required this.urls,
  });

  @override
  List<Object> get props => [
        id,
        username,
        email,
        firstName,
        lastName,
        institution,
        urls,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
