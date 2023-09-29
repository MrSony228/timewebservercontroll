import 'package:json_annotation/json_annotation.dart';
import 'package:timewebservercontroll/network/model/server_action.dart';

part 'output_action_body.g.dart';

@JsonSerializable(createFactory: false)
class OutputActionBody {
  final ServerAction action;

  OutputActionBody(this.action);

  Map<String, dynamic> toJson() => _$OutputActionBodyToJson(this);
}
