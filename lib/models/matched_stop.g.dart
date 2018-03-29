// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_stop.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MatchedStop _$MatchedStopFromJson(Map<String, dynamic> json) => new MatchedStop(
    routeId: json['routeId'] as int,
    parentId: json['parentId'] as String,
    stationId: json['stationId'] as String,
    icsId: json['icsId'] as String,
    topMostParentId: json['topMostParentId'] as String,
    direction: json['direction'] as String,
    towards: json['towards'] as String,
    modes: (json['modes'] as List)?.map((e) => e as String)?.toList(),
    stopType: json['stopType'] as String,
    stopLetter: json['stopLetter'] as String,
    zone: json['zone'] as String,
    accessibilitySummary: json['accessibilitySummary'] as String,
    hasDisruption: json['hasDisruption'] as bool,
    lines: (json['lines'] as List)
        ?.map((e) => e == null
            ? null
            : new Identifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as bool,
    id: json['id'] as String,
    url: json['url'] as String,
    name: json['name'] as String,
    lat: json['lat'] as int,
    lon: json['lon'] as int);

abstract class _$MatchedStopSerializerMixin {
  int get routeId;
  String get parentId;
  String get stationId;
  String get icsId;
  String get topMostParentId;
  String get direction;
  String get towards;
  List<String> get modes;
  String get stopType;
  String get stopLetter;
  String get zone;
  String get accessibilitySummary;
  bool get hasDisruption;
  List<Identifier> get lines;
  bool get status;
  String get id;
  String get url;
  String get name;
  int get lat;
  int get lon;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'routeId': routeId,
        'parentId': parentId,
        'stationId': stationId,
        'icsId': icsId,
        'topMostParentId': topMostParentId,
        'direction': direction,
        'towards': towards,
        'modes': modes,
        'stopType': stopType,
        'stopLetter': stopLetter,
        'zone': zone,
        'accessibilitySummary': accessibilitySummary,
        'hasDisruption': hasDisruption,
        'lines': lines,
        'status': status,
        'id': id,
        'url': url,
        'name': name,
        'lat': lat,
        'lon': lon
      };
}
