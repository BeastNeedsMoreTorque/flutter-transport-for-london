// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) => new Line(
    id: json['id'] as String,
    name: json['name'] as String,
    modeName: json['modeName'] as String,
    disruptions: (json['disruptions'] as List)
        ?.map((e) => e == null
            ? null
            : new Disruption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    lineStatuses: (json['lineStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : new LineStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    routeSections: json['routeSections'] as List,
    serviceTypes: (json['serviceTypes'] as List)
        ?.map((e) => e == null
            ? null
            : new LineServiceTypeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crowding: json['crowding']);

abstract class _$LineSerializerMixin {
  String get id;
  String get name;
  String get modeName;
  List<Disruption> get disruptions;
  DateTime get created;
  DateTime get modified;
  List<LineStatus> get lineStatuses;
  List<dynamic> get routeSections;
  List<LineServiceTypeInfo> get serviceTypes;
  Object get crowding;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'modeName': modeName,
        'disruptions': disruptions,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'lineStatuses': lineStatuses,
        'routeSections': routeSections,
        'serviceTypes': serviceTypes,
        'crowding': crowding
      };
}
