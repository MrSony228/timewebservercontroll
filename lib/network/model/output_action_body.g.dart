// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_action_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OutputActionBodyToJson(OutputActionBody instance) =>
    <String, dynamic>{
      'action': _$ServerActionEnumMap[instance.action]!,
    };

const _$ServerActionEnumMap = {
  ServerAction.hardReboot: 'hard_reboot',
  ServerAction.reboot: 'reboot',
  ServerAction.shutdown: 'shutdown',
  ServerAction.start: 'start',
};
