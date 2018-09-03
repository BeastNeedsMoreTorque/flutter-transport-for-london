// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return Identifier(
      id: json['id'] as String,
      name: json['name'] as String,
      uri: json['uri'] as String,
      type: json['type'] as String,
      crowding: json['crowding']);
}

Map<String, dynamic> _$IdentifierToJson(Identifier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uri': instance.uri,
      'type': instance.type,
      'crowding': instance.crowding
    };
