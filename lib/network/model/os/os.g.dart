// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Os _$OsFromJson(Map<String, dynamic> json) => Os(
      json['id'] as int,
      $enumDecode(_$OsTypeEnumMap, json['name']),
      json['version'] as String?,
    );

Map<String, dynamic> _$OsToJson(Os instance) => <String, dynamic>{
      'id': instance.id,
      'name': _$OsTypeEnumMap[instance.type]!,
      'version': instance.version,
    };

const _$OsTypeEnumMap = {
  OsType.bitirix: 'bitirix',
  OsType.brainycp: 'brainycp',
  OsType.centos: 'centos',
  OsType.debian: 'debian',
  OsType.fedora: 'fedora',
  OsType.freebsd: 'freebsd',
  OsType.gentoo: 'gentoo',
  OsType.routeros: 'routeros',
  OsType.ubuntu: 'ubuntu',
  OsType.windows: 'windows',
};
