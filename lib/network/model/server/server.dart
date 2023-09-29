import 'package:json_annotation/json_annotation.dart';
import 'package:timewebservercontroll/network/model/disk/disk.dart';
import 'package:timewebservercontroll/network/model/os/os.dart';
import 'package:timewebservercontroll/network/model/software.dart';

part 'server.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Server {
  final int id;
  final String name;
  final String comment;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAtDate;
  final Os os;
  final Software? software;
  final int? presentId;
  final String location;
  final int? configuratorId;
  final String? bootMode;
  final int cpu;
  final String cpuFrequency;
  final int ram;
  final List<Disk> disks;

  Server(
    this.id,
    this.name,
    this.status,
    this.comment,
    this.createdAtDate,
    this.os,
    this.software,
    this.presentId,
    this.location,
    this.configuratorId,
    this.bootMode,
    this.cpu,
    this.cpuFrequency,
    this.ram,
    this.disks,
  );

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
