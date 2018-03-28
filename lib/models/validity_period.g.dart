// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validity_period.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ValidityPeriod _$ValidityPeriodFromJson(Map<String, dynamic> json) =>
    new ValidityPeriod(
        fromDate: json['fromDate'] == null
            ? null
            : DateTime.parse(json['fromDate'] as String),
        toDate: json['toDate'] == null
            ? null
            : DateTime.parse(json['toDate'] as String),
        isNow: json['isNow'] as bool);

abstract class _$ValidityPeriodSerializerMixin {
  DateTime get fromDate;
  DateTime get toDate;
  bool get isNow;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'fromDate': fromDate?.toIso8601String(),
        'toDate': toDate?.toIso8601String(),
        'isNow': isNow
      };
}
