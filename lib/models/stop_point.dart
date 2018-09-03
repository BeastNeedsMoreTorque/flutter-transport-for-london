import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/additional_property.dart';
import 'package:transport_for_london/models/identifier.dart';
import 'package:transport_for_london/models/line_group.dart';
import 'package:transport_for_london/models/line_mode_group.dart';

part 'stop_point.g.dart';

@JsonSerializable()
class StopPoint {
  StopPoint({
    this.naptanId,
    this.indicator,
    this.stopLetter,
    this.modes,
    this.icsCode,
    this.stopType,
    this.stationNaptan,
    this.hubNaptanCode,
    this.lines,
    this.lineGroups,
    this.lineModeGroups,
    this.status,
    this.id,
    this.commonName,
    this.placeType,
    this.additionalProperties,
    this.children,
    this.lat,
    this.lon,
  });

  String naptanId;
  String indicator;
  String stopLetter;
  List<String> modes;
  String icsCode;
  String stopType;
  String stationNaptan;
  String hubNaptanCode;
  List<Identifier> lines;
  List<LineGroup> lineGroups;
  List<LineModeGroup> lineModeGroups;
  bool status;
  String id;
  String commonName;
  String placeType;
  List<AdditionalProperty> additionalProperties;
  List<StopPoint> children;
  double lat;
  double lon;

  factory StopPoint.fromJson(Map<String, dynamic> json) {
    return _$StopPointFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StopPointToJson(this);
  }
}
