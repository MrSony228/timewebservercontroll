// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinanceResponse _$FinanceResponseFromJson(Map<String, dynamic> json) =>
    FinanceResponse(
      json['response_id'] as String,
      Finance.fromJson(json['finances'] as Map<String, dynamic>),
    );
