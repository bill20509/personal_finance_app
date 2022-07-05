import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:transaction_api/src/models/json_map.dart';
import 'package:uuid/uuid.dart';

part 'transaction.g.dart';

/// model of transaction
@immutable
@JsonSerializable()
class Transaction extends Equatable {
  /// constructor
  Transaction({
    String? id,
    required this.title,
    this.amount = 0,
    this.desc = '',
    required this.date,
  }) : id = id ?? const Uuid().v4();

  /// unique id of transaction
  final String id;

  /// tilte of transaction
  final String title;

  /// amount of transaction
  final double amount;

  /// description of transaction
  final String desc;

  /// date
  final DateTime date;

  /// from json
  static Transaction fromJson(JsonMap json) => _$TransactionFromJson(json);

  /// to Json
  JsonMap toJson() => _$TransactionToJson(this);

  @override
  List<Object?> get props => [title, amount, desc, date];
}
