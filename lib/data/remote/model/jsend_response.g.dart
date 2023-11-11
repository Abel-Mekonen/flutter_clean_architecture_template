// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jsend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JSendResponse _$JSendResponseFromJson(Map<String, dynamic> json) =>
    JSendResponse(
      status: json['status'] as int,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$JSendResponseToJson(JSendResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
