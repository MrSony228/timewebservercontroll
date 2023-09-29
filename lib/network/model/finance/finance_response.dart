import 'package:json_annotation/json_annotation.dart';
import 'package:timewebservercontroll/network/model/finance/finance.dart';

part 'finance_response.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FinanceResponse {
  final String responseId;
  final Finance finances;

  FinanceResponse(this.responseId, this.finances);

  factory FinanceResponse.fromJson(Map<String, dynamic> json) =>
      _$FinanceResponseFromJson(json);
}
