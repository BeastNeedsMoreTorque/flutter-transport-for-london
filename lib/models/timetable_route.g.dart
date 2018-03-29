// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_route.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TimetableRoute _$TimetableRouteFromJson(Map<String, dynamic> json) =>
    new TimetableRoute(
        stationIntervals: (json['stationIntervals'] as List)
            ?.map((e) => e == null
                ? null
                : new StationInterval.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        schedules: (json['schedules'] as List)
            ?.map((e) => e == null
                ? null
                : new Schedule.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$TimetableRouteSerializerMixin {
  List<StationInterval> get stationIntervals;
  List<Schedule> get schedules;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'stationIntervals': stationIntervals,
        'schedules': schedules
      };
}
