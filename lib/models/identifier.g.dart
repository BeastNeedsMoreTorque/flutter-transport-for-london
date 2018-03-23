// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Identifier _$IdentifierFromJson(Map<String, dynamic> json) => new Identifier(
    id: json['id'] as String,
    name: json['name'] as String,
    uri: json['uri'] as String,
    type: json['type'] as String,
    crowding: json['crowding']);

abstract class _$IdentifierSerializerMixin {
  String get id;
  String get name;
  String get uri;
  String get type;
  Object get crowding;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'uri': uri,
        'type': type,
        'crowding': crowding
      };
}
