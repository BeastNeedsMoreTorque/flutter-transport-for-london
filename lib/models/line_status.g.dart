// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_status.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LineStatus _$LineStatusFromJson(Map<String, dynamic> json) => new LineStatus(
    id: json['id'] as int,
    statusSeverity: json['statusSeverity'] as int,
    statusSeverityDescription: json['statusSeverityDescription'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    validityPeriods: json['validityPeriods'] as List);

abstract class _$LineStatusSerializerMixin {
  int get id;
  int get statusSeverity;
  String get statusSeverityDescription;
  DateTime get created;
  List<dynamic> get validityPeriods;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'statusSeverity': statusSeverity,
        'statusSeverityDescription': statusSeverityDescription,
        'created': created?.toIso8601String(),
        'validityPeriods': validityPeriods
      };
}
