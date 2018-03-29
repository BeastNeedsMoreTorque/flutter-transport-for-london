import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/timetable_route.dart';

part 'timetable.g.dart';

@JsonSerializable()
class Timetable extends Object with _$TimetableSerializerMixin {
  Timetable({
    this.departureStopId,
    this.routes,
  });

  String departureStopId;
  List<TimetableRoute> routes;

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return _$TimetableFromJson(json);
  }
}
