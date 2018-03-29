// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interval.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Interval _$IntervalFromJson(Map<String, dynamic> json) => new Interval(
    stopId: json['stopId'] as String,
    timeToArrival: json['timeToArrival'] as int);

abstract class _$IntervalSerializerMixin {
  String get stopId;
  int get timeToArrival;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'stopId': stopId, 'timeToArrival': timeToArrival};
}
