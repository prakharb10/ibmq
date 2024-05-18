// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runtime_api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuntimeAPIError _$RuntimeAPIErrorFromJson(Map<String, dynamic> json) =>
    RuntimeAPIError(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      solution: json['solution'] as String,
      moreInfo: json['more_info'] as String,
    );
