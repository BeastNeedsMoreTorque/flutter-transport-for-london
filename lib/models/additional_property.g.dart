// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalProperty _$AdditionalPropertyFromJson(Map<String, dynamic> json) {
  return AdditionalProperty(
      category: json['category'] as String,
      key: json['key'] as String,
      sourceSystemKey: json['sourceSystemKey'] as String,
      value: json['value'] as String);
}

Map<String, dynamic> _$AdditionalPropertyToJson(AdditionalProperty instance) =>
    <String, dynamic>{
      'category': instance.category,
      'key': instance.key,
      'sourceSystemKey': instance.sourceSystemKey,
      'value': instance.value
    };
