import 'package:json_annotation/json_annotation.dart';

part 'identifier.g.dart';

@JsonSerializable()
class Identifier {
  Identifier({
    this.id,
    this.name,
    this.uri,
    this.type,
    this.crowding,
  });

  String id;
  String name;
  String uri;
  String type;
  Object crowding;

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return _$IdentifierFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$IdentifierToJson(this);
  }
}
