import 'package:json_annotation/json_annotation.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration extends Object with _$ConfigurationSerializerMixin {
  Configuration();

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return _$ConfigurationFromJson(json);
  }

  Configuration copyWith() {
    return new Configuration();
  }
}
