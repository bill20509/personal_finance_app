import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:transaction_api/src/models/json_map.dart';
import 'package:uuid/uuid.dart';

part 'transaction.g.dart';

/// Trasanction Type
enum TransactionType {
  /// Trasanction Type for income
  income,

  /// Trasanction Type for outcome
  outcome,
}

/// model of transaction
@immutable
@JsonSerializable()
class Transaction extends Equatable {
  /// constructor
  Transaction({
    String? id,
    required this.title,
    this.imagePath,
    this.amount = 0,
    this.desc = '',
    required this.date,
    required this.transactionType,
    required this.mainType,
    required this.subType,
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

  /// trsanction type
  final TransactionType transactionType;

  /// main type, ex: food
  final String mainType;

  /// sub type, ex; dinner
  final String subType;

  /// image path
  final String? imagePath;

  /// from json
  static Transaction fromJson(JsonMap json) => _$TransactionFromJson(json);

  /// to Json
  JsonMap toJson() => _$TransactionToJson(this);

  /// copy method
  Transaction copyWith({
    String? id,
    String? title,
    double? amount,
    String? desc,
    DateTime? date,
    TransactionType? transactionType,
    String? mainType,
    String? subType,
    String? imagePath,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      transactionType: transactionType ?? this.transactionType,
      mainType: mainType ?? this.mainType,
      subType: subType ?? this.subType,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [
        title,
        amount,
        desc,
        date,
        transactionType,
        mainType,
        subType,
        imagePath,
      ];
}
