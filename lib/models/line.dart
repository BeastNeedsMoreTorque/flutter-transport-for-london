import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/line_service_type_info.dart';
import 'package:transport_for_london/models/line_status.dart';

part 'line.g.dart';

@JsonSerializable()
class Line {
  Line({
    this.id,
    this.name,
    this.modeName,
    this.disruptions,
    this.created,
    this.modified,
    this.lineStatuses,
    this.routeSections,
    this.serviceTypes,
    this.crowding,
  });

  String id;
  String name;
  String modeName;
  List<Disruption> disruptions;
  DateTime created;
  DateTime modified;
  List<LineStatus> lineStatuses;
  List routeSections;
  List<LineServiceTypeInfo> serviceTypes;
  Object crowding;

  factory Line.fromJson(Map<String, dynamic> json) {
    return _$LineFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LineToJson(this);
  }
}
