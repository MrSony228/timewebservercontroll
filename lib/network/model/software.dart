import 'package:json_annotation/json_annotation.dart';

part 'software.g.dart';

@JsonSerializable()
class Software {
  final int id;
  final String name;

  Software({required this.id, required this.name});

  factory Software.fromJson(Map<String, dynamic> json) =>
      _$SoftwareFromJson(json);
}
