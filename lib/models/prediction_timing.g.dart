// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_timing.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

PredictionTiming _$PredictionTimingFromJson(Map<String, dynamic> json) =>
    new PredictionTiming(
        countdownServerAdjustment: json['countdownServerAdjustment'] as String,
        source: json['source'] == null
            ? null
            : DateTime.parse(json['source'] as String),
        insert: json['insert'] == null
            ? null
            : DateTime.parse(json['insert'] as String),
        read: json['read'] == null
            ? null
            : DateTime.parse(json['read'] as String),
        sent: json['sent'] == null
            ? null
            : DateTime.parse(json['sent'] as String),
        received: json['received'] == null
            ? null
            : DateTime.parse(json['received'] as String));

abstract class _$PredictionTimingSerializerMixin {
  String get countdownServerAdjustment;
  DateTime get source;
  DateTime get insert;
  DateTime get read;
  DateTime get sent;
  DateTime get received;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'countdownServerAdjustment': countdownServerAdjustment,
        'source': source?.toIso8601String(),
        'insert': insert?.toIso8601String(),
        'read': read?.toIso8601String(),
        'sent': sent?.toIso8601String(),
        'received': received?.toIso8601String()
      };
}
