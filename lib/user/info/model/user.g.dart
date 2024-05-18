// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      institution: json['institution'] as String,
      urls: UserUrls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'institution': instance.institution,
      'urls': instance.urls,
    };

UserUrls _$UserUrlsFromJson(Map<String, dynamic> json) => UserUrls(
      http: Uri.parse(json['http'] as String),
      ws: Uri.parse(json['ws'] as String),
      services: _$recordConvert(
        json['services'],
        ($jsonValue) => (
          quantumLab: Uri.parse($jsonValue['quantumLab'] as String),
          runtime: Uri.parse($jsonValue['runtime'] as String),
        ),
      ),
    );

Map<String, dynamic> _$UserUrlsToJson(UserUrls instance) => <String, dynamic>{
      'http': instance.http.toString(),
      'ws': instance.ws.toString(),
      'services': <String, dynamic>{
        'quantumLab': instance.services.quantumLab.toString(),
        'runtime': instance.services.runtime.toString(),
      },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
