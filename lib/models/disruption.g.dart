// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disruption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disruption _$DisruptionFromJson(Map<String, dynamic> json) {
  return Disruption(
      category: json['category'] as String,
      type: json['type'] as String,
      categoryDescription: json['categoryDescription'] as String,
      description: json['description'] as String,
      affectedRoutes: json['affectedRoutes'] as List,
      affectedStops: json['affectedStops'] as List,
      closureText: json['closureText'] as String);
}

Map<String, dynamic> _$DisruptionToJson(Disruption instance) =>
    <String, dynamic>{
      'category': instance.category,
      'type': instance.type,
      'categoryDescription': instance.categoryDescription,
      'description': instance.description,
      'affectedRoutes': instance.affectedRoutes,
      'affectedStops': instance.affectedStops,
      'closureText': instance.closureText
    };
