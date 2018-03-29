// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) => new Timetable(
    departureStopId: json['departureStopId'] as String,
    routes: (json['routes'] as List)
        ?.map((e) => e == null
            ? null
            : new TimetableRoute.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$TimetableSerializerMixin {
  String get departureStopId;
  List<TimetableRoute> get routes;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'departureStopId': departureStopId, 'routes': routes};
}
