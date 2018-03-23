// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_group.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LineGroup _$LineGroupFromJson(Map<String, dynamic> json) => new LineGroup(
    stationAtcoCode: json['stationAtcoCode'] as String,
    lineIdentifier:
        (json['lineIdentifier'] as List)?.map((e) => e as String)?.toList());

abstract class _$LineGroupSerializerMixin {
  String get stationAtcoCode;
  List<String> get lineIdentifier;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'stationAtcoCode': stationAtcoCode,
        'lineIdentifier': lineIdentifier
      };
}
