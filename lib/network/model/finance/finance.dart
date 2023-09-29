import 'package:json_annotation/json_annotation.dart';

part 'finance.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Finance {
  final double balance;
  final double? hoursLeft;

  Finance(this.balance, this.hoursLeft);

  factory Finance.fromJson(Map<String, dynamic> json) =>
      _$FinanceFromJson(json);
}
