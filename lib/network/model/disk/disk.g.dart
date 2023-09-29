// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disk _$DiskFromJson(Map<String, dynamic> json) => Disk(
      json['id'] as int,
      json['size'] as int,
      json['used'] as int,
      json['type'] as String,
      json['is_mounted'] as bool,
      json['is_system'] as bool,
      json['system_name'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$DiskToJson(Disk instance) => <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'used': instance.used,
      'type': instance.type,
      'is_mounted': instance.isMounted,
      'is_system': instance.isSystem,
      'system_name': instance.systemName,
      'status': instance.status,
    };
