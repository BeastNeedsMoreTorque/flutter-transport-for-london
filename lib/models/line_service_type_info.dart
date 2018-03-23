import 'package:json_annotation/json_annotation.dart';

part 'line_service_type_info.g.dart';

@JsonSerializable()
class LineServiceTypeInfo extends Object
    with _$LineServiceTypeInfoSerializerMixin {
  LineServiceTypeInfo({this.name, this.uri});

  String name;
  String uri;

  factory LineServiceTypeInfo.fromJson(Map<String, dynamic> json) {
    return _$LineServiceTypeInfoFromJson(json);
  }
}
