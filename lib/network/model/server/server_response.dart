import 'package:json_annotation/json_annotation.dart';
import 'package:timewebservercontroll/network/model/server/server.dart';

part 'server_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ServerResponse {
  final String responseId;
  final Server server;

  ServerResponse(this.responseId, this.server);

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);
}
