import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/schedule.dart';
import 'package:transport_for_london/models/station_interval.dart';

part 'timetable_route.g.dart';

@JsonSerializable()
class TimetableRoute extends Object with _$TimetableRouteSerializerMixin {
  TimetableRoute({
    this.stationIntervals,
    this.schedules,
  });

  List<StationInterval> stationIntervals;
  List<Schedule> schedules;

  factory TimetableRoute.fromJson(Map<String, dynamic> json) {
    return _$TimetableRouteFromJson(json);
  }
}
