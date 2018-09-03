import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/disambiguation.dart';
import 'package:transport_for_london/models/matched_stop.dart';
import 'package:transport_for_london/models/timetable.dart';

part 'timetable_response.g.dart';

@JsonSerializable()
class TimetableResponse {
  TimetableResponse({
    this.lineId,
    this.lineName,
    this.direction,
    this.pdfUrl,
    this.stations,
    this.stops,
    this.timetable,
    this.disambiguation,
  });

  String lineId;
  String lineName;
  String direction;
  String pdfUrl;
  List<MatchedStop> stations;
  List<MatchedStop> stops;
  Timetable timetable;
  Disambiguation disambiguation;

  factory TimetableResponse.fromJson(Map<String, dynamic> json) {
    return _$TimetableResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TimetableResponseToJson(this);
  }
}
