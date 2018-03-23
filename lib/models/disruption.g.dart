// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disruption.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Disruption _$DisruptionFromJson(Map<String, dynamic> json) => new Disruption(
    category: json['category'] as String,
    type: json['type'] as String,
    categoryDescription: json['categoryDescription'] as String,
    description: json['description'] as String,
    affectedRoutes: json['affectedRoutes'] as List,
    affectedStops: json['affectedStops'] as List,
    closureText: json['closureText'] as String);

abstract class _$DisruptionSerializerMixin {
  String get category;
  String get type;
  String get categoryDescription;
  String get description;
  List<dynamic> get affectedRoutes;
  List<dynamic> get affectedStops;
  String get closureText;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'category': category,
        'type': type,
        'categoryDescription': categoryDescription,
        'description': description,
        'affectedRoutes': affectedRoutes,
        'affectedStops': affectedStops,
        'closureText': closureText
      };
}
