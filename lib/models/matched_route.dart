import 'package:json_annotation/json_annotation.dart';

part 'matched_route.g.dart';

@JsonSerializable()
class MatchedRoute {
  MatchedRoute({
    this.name,
    this.direction,
    this.originationName,
    this.destinationName,
    this.originator,
    this.destination,
    this.serviceType,
    this.validTo,
    this.validFrom,
  });

  String name;
  String direction;
  String originationName;
  String destinationName;
  String originator;
  String destination;
  String serviceType;
  DateTime validTo;
  DateTime validFrom;

  factory MatchedRoute.fromJson(Map<String, dynamic> json) {
    return _$MatchedRouteFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MatchedRouteToJson(this);
  }
}
