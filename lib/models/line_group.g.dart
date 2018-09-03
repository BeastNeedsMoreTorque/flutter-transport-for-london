// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineGroup _$LineGroupFromJson(Map<String, dynamic> json) {
  return LineGroup(
      stationAtcoCode: json['stationAtcoCode'] as String,
      lineIdentifier:
          (json['lineIdentifier'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$LineGroupToJson(LineGroup instance) => <String, dynamic>{
      'stationAtcoCode': instance.stationAtcoCode,
      'lineIdentifier': instance.lineIdentifier
    };
