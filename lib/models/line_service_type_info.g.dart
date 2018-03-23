// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_service_type_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LineServiceTypeInfo _$LineServiceTypeInfoFromJson(Map<String, dynamic> json) =>
    new LineServiceTypeInfo(
        name: json['name'] as String, uri: json['uri'] as String);

abstract class _$LineServiceTypeInfoSerializerMixin {
  String get name;
  String get uri;
  Map<String, dynamic> toJson() => <String, dynamic>{'name': name, 'uri': uri};
}
