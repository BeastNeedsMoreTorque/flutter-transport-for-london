// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopPoint _$StopPointFromJson(Map<String, dynamic> json) {
  return StopPoint(
      naptanId: json['naptanId'] as String,
      indicator: json['indicator'] as String,
      stopLetter: json['stopLetter'] as String,
      modes: (json['modes'] as List)?.map((e) => e as String)?.toList(),
      icsCode: json['icsCode'] as String,
      stopType: json['stopType'] as String,
      stationNaptan: json['stationNaptan'] as String,
      hubNaptanCode: json['hubNaptanCode'] as String,
      lines: (json['lines'] as List)
          ?.map((e) =>
              e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      lineGroups: (json['lineGroups'] as List)
          ?.map((e) =>
              e == null ? null : LineGroup.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      lineModeGroups: (json['lineModeGroups'] as List)
          ?.map((e) => e == null
              ? null
              : LineModeGroup.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      status: json['status'] as bool,
      id: json['id'] as String,
      commonName: json['commonName'] as String,
      placeType: json['placeType'] as String,
      additionalProperties: (json['additionalProperties'] as List)
          ?.map((e) => e == null
              ? null
              : AdditionalProperty.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      children: (json['children'] as List)
          ?.map((e) =>
              e == null ? null : StopPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      lat: (json['lat'] as num)?.toDouble(),
      lon: (json['lon'] as num)?.toDouble());
}

Map<String, dynamic> _$StopPointToJson(StopPoint instance) => <String, dynamic>{
      'naptanId': instance.naptanId,
      'indicator': instance.indicator,
      'stopLetter': instance.stopLetter,
      'modes': instance.modes,
      'icsCode': instance.icsCode,
      'stopType': instance.stopType,
      'stationNaptan': instance.stationNaptan,
      'hubNaptanCode': instance.hubNaptanCode,
      'lines': instance.lines,
      'lineGroups': instance.lineGroups,
      'lineModeGroups': instance.lineModeGroups,
      'status': instance.status,
      'id': instance.id,
      'commonName': instance.commonName,
      'placeType': instance.placeType,
      'additionalProperties': instance.additionalProperties,
      'children': instance.children,
      'lat': instance.lat,
      'lon': instance.lon
    };
