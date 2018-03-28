// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_status.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LineStatus _$LineStatusFromJson(Map<String, dynamic> json) => new LineStatus(
    id: json['id'] as int,
    lineId: json['lineId'] as String,
    statusSeverity: json['statusSeverity'] as int,
    statusSeverityDescription: json['statusSeverityDescription'] as String,
    reason: json['reason'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    validityPeriods: (json['validityPeriods'] as List)
        ?.map((e) => e == null
            ? null
            : new ValidityPeriod.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    disruption: json['disruption'] == null
        ? null
        : new Disruption.fromJson(json['disruption'] as Map<String, dynamic>));

abstract class _$LineStatusSerializerMixin {
  int get id;
  String get lineId;
  int get statusSeverity;
  String get statusSeverityDescription;
  String get reason;
  DateTime get created;
  List<ValidityPeriod> get validityPeriods;
  Disruption get disruption;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'lineId': lineId,
        'statusSeverity': statusSeverity,
        'statusSeverityDescription': statusSeverityDescription,
        'reason': reason,
        'created': created?.toIso8601String(),
        'validityPeriods': validityPeriods,
        'disruption': disruption
      };
}
