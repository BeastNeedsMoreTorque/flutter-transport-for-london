// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_route.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MatchedRoute _$MatchedRouteFromJson(Map<String, dynamic> json) =>
    new MatchedRoute(
        name: json['name'] as String,
        direction: json['direction'] as String,
        originationName: json['originationName'] as String,
        destinationName: json['destinationName'] as String,
        originator: json['originator'] as String,
        destination: json['destination'] as String,
        serviceType: json['serviceType'] as String,
        validTo: json['validTo'] == null
            ? null
            : DateTime.parse(json['validTo'] as String),
        validFrom: json['validFrom'] == null
            ? null
            : DateTime.parse(json['validFrom'] as String));

abstract class _$MatchedRouteSerializerMixin {
  String get name;
  String get direction;
  String get originationName;
  String get destinationName;
  String get originator;
  String get destination;
  String get serviceType;
  DateTime get validTo;
  DateTime get validFrom;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'direction': direction,
        'originationName': originationName,
        'destinationName': destinationName,
        'originator': originator,
        'destination': destination,
        'serviceType': serviceType,
        'validTo': validTo?.toIso8601String(),
        'validFrom': validFrom?.toIso8601String()
      };
}
