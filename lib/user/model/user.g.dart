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
      http: json['http'] as String,
      ws: json['ws'] as String,
      services: Map<String, String>.from(json['services'] as Map),
    );

Map<String, dynamic> _$UserUrlsToJson(UserUrls instance) => <String, dynamic>{
      'http': instance.http,
      'ws': instance.ws,
      'services': instance.services,
    };
