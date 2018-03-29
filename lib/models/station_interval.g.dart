// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_interval.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

StationInterval _$StationIntervalFromJson(Map<String, dynamic> json) =>
    new StationInterval(
        id: json['id'] as String,
        intervals: (json['intervals'] as List)
            ?.map((e) => e == null
                ? null
                : new Interval.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$StationIntervalSerializerMixin {
  String get id;
  List<Interval> get intervals;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'intervals': intervals};
}
