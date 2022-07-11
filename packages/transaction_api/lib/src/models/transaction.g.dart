// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      title: json['title'] as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      desc: json['desc'] as String? ?? '',
      date: DateTime.parse(json['date'] as String),
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
      mainType: json['mainType'] as String,
      subType: json['subType'] as String,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'desc': instance.desc,
      'date': instance.date.toIso8601String(),
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'mainType': instance.mainType,
      'subType': instance.subType,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.outcome: 'outcome',
};
