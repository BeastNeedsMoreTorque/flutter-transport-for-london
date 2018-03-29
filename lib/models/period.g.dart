// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Period _$PeriodFromJson(Map<String, dynamic> json) => new Period(
    type: json['type'] as String,
    fromTime: json['fromTime'] == null
        ? null
        : new TwentyFourHourClockTime.fromJson(
            json['fromTime'] as Map<String, dynamic>),
    toTime: json['toTime'] == null
        ? null
        : new TwentyFourHourClockTime.fromJson(
            json['toTime'] as Map<String, dynamic>),
    frequency: json['frequency'] == null
        ? null
        : new ServiceFrequency.fromJson(
            json['frequency'] as Map<String, dynamic>));

abstract class _$PeriodSerializerMixin {
  String get type;
  TwentyFourHourClockTime get fromTime;
  TwentyFourHourClockTime get toTime;
  ServiceFrequency get frequency;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'fromTime': fromTime,
        'toTime': toTime,
        'frequency': frequency
      };
}
