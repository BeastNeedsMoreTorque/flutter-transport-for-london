import 'package:json_annotation/json_annotation.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration {
  Configuration();

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return _$ConfigurationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfigurationToJson(this);
  }

  Configuration copyWith() {
    return Configuration();
  }
}
