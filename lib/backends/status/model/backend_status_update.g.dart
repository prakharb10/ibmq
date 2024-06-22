// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_status_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendStatusUpdateImpl _$$BackendStatusUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$BackendStatusUpdateImpl(
      type: json['type'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  lengthQueue: ($jsonValue['lengthQueue'] as num).toInt(),
                  name: $jsonValue['name'] as String,
                ),
              ))
          .toList(),
    );

Map<String, dynamic> _$$BackendStatusUpdateImplToJson(
        _$BackendStatusUpdateImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data
          .map((e) => <String, dynamic>{
                'lengthQueue': e.lengthQueue,
                'name': e.name,
              })
          .toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
