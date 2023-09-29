// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) => Server(
      json['id'] as int,
      json['name'] as String,
      json['status'] as String,
      json['comment'] as String,
      json['created_at'] as String,
      Os.fromJson(json['os'] as Map<String, dynamic>),
      json['software'] == null
          ? null
          : Software.fromJson(json['software'] as Map<String, dynamic>),
      json['present_id'] as int?,
      json['location'] as String,
      json['configurator_id'] as int?,
      json['boot_mode'] as String?,
      json['cpu'] as int,
      json['cpu_frequency'] as String,
      json['ram'] as int,
      (json['disks'] as List<dynamic>)
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
