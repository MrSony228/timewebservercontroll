import 'package:json_annotation/json_annotation.dart';

part 'disk.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Disk {
  final int id;
  final int size;
  final int used;
  final String type;
  final bool isMounted;
  final bool isSystem;
  final String systemName;
  final String status;

  Disk(
    this.id,
    this.size,
    this.used,
    this.type,
    this.isMounted,
    this.isSystem,
    this.systemName,
    this.status,
  );

  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}
