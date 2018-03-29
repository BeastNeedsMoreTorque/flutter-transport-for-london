// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => new Schedule(
    name: json['name'] as String,
    knownJourneys: (json['knownJourneys'] as List)
        ?.map((e) => e == null
            ? null
            : new KnownJourney.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    firstJourney: json['firstJourney'] == null
        ? null
        : new KnownJourney.fromJson(
            json['firstJourney'] as Map<String, dynamic>),
    lastJourney: json['lastJourney'] == null
        ? null
        : new KnownJourney.fromJson(
            json['lastJourney'] as Map<String, dynamic>),
    periods: (json['periods'] as List)
        ?.map((e) =>
            e == null ? null : new Period.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$ScheduleSerializerMixin {
  String get name;
  List<KnownJourney> get knownJourneys;
  KnownJourney get firstJourney;
  KnownJourney get lastJourney;
  List<Period> get periods;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'knownJourneys': knownJourneys,
        'firstJourney': firstJourney,
        'lastJourney': lastJourney,
        'periods': periods
      };
}
