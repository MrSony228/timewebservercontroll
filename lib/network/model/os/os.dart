import 'package:json_annotation/json_annotation.dart';
import 'package:timewebservercontroll/network/model/os/os_type.dart';

part 'os.g.dart';

@JsonSerializable()
class Os {
  final int id;
  @JsonKey(name: 'name')
  final OsType type;
  final String? version;

  Os(this.id, this.type, this.version);

  factory Os.fromJson(Map<String, dynamic> json) => _$OsFromJson(json);
}
