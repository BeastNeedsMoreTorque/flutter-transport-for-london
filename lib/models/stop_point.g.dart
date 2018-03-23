// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_point.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

StopPoint _$StopPointFromJson(Map<String, dynamic> json) => new StopPoint(
    naptanId: json['naptanId'] as String,
    modes: (json['modes'] as List)?.map((e) => e as String)?.toList(),
    icsCode: json['icsCode'] as String,
    stopType: json['stopType'] as String,
    stationNaptan: json['stationNaptan'] as String,
    hubNaptanCode: json['hubNaptanCode'] as String,
    lines: (json['lines'] as List)
        ?.map((e) => e == null
            ? null
            : new Identifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lineGroups: (json['lineGroups'] as List)
        ?.map((e) => e == null
            ? null
            : new LineGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lineModeGroups: (json['lineModeGroups'] as List)
        ?.map((e) => e == null
            ? null
            : new LineModeGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as bool,
    id: json['id'] as String,
    commonName: json['commonName'] as String,
    placeType: json['placeType'] as String,
    additionalProperties: (json['additionalProperties'] as List)
        ?.map((e) => e == null
            ? null
            : new AdditionalProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : new StopPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble());

abstract class _$StopPointSerializerMixin {
  String get naptanId;
  List<String> get modes;
  String get icsCode;
  String get stopType;
  String get stationNaptan;
  String get hubNaptanCode;
  List<Identifier> get lines;
  List<LineGroup> get lineGroups;
  List<LineModeGroup> get lineModeGroups;
  bool get status;
  String get id;
  String get commonName;
  String get placeType;
  List<AdditionalProperty> get additionalProperties;
  List<StopPoint> get children;
  double get lat;
  double get lon;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'naptanId': naptanId,
        'modes': modes,
        'icsCode': icsCode,
        'stopType': stopType,
        'stationNaptan': stationNaptan,
        'hubNaptanCode': hubNaptanCode,
        'lines': lines,
        'lineGroups': lineGroups,
        'lineModeGroups': lineModeGroups,
        'status': status,
        'id': id,
        'commonName': commonName,
        'placeType': placeType,
        'additionalProperties': additionalProperties,
        'children': children,
        'lat': lat,
        'lon': lon
      };
}
