// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      (json['code'] as num?)?.toInt(),
      json['isError'] as bool?,
      json['message'] as String?,
      json['date'] == null
          ? null
          : LoginData.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isError': instance.isError,
      'message': instance.message,
      'date': instance.date,
    };
