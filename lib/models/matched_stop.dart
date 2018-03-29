import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/identifier.dart';

part 'matched_stop.g.dart';

@JsonSerializable()
class MatchedStop extends Object with _$MatchedStopSerializerMixin {
  MatchedStop({
    this.routeId,
    this.parentId,
    this.stationId,
    this.icsId,
    this.topMostParentId,
    this.direction,
    this.towards,
    this.modes,
    this.stopType,
    this.stopLetter,
    this.zone,
    this.accessibilitySummary,
    this.hasDisruption,
    this.lines,
    this.status,
    this.id,
    this.url,
    this.name,
    this.lat,
    this.lon,
  });

  int routeId;
  String parentId;
  String stationId;
  String icsId;
  String topMostParentId;
  String direction;
  String towards;
  List<String> modes;
  String stopType;
  String stopLetter;
  String zone;
  String accessibilitySummary;
  bool hasDisruption;
  List<Identifier> lines;
  bool status;
  String id;
  String url;
  String name;
  int lat;
  int lon;

  factory MatchedStop.fromJson(Map<String, dynamic> json) {
    return _$MatchedStopFromJson(json);
  }
}
