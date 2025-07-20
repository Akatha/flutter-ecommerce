// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      token: json['token'] as String? ?? '',
      role: json['role'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'userId': instance.userId,
    };
