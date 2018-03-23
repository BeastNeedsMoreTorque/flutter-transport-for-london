// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_property.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AdditionalProperty _$AdditionalPropertyFromJson(Map<String, dynamic> json) =>
    new AdditionalProperty(
        category: json['category'] as String,
        key: json['key'] as String,
        sourceSystemKey: json['sourceSystemKey'] as String,
        value: json['value'] as String);

abstract class _$AdditionalPropertySerializerMixin {
  String get category;
  String get key;
  String get sourceSystemKey;
  String get value;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'category': category,
        'key': key,
        'sourceSystemKey': sourceSystemKey,
        'value': value
      };
}
