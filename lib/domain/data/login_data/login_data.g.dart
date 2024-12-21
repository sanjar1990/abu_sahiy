// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      json['id'] as String?,
      json['phone'] as String?,
      json['name'] as String?,
      json['username'] as String?,
      json['jwt'] as String?,
      json['createdDate'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'username': instance.username,
      'jwt': instance.jwt,
      'createdDate': instance.createdDate,
    };
