import 'package:json_annotation/json_annotation.dart';

part 'service_frequency.g.dart';

@JsonSerializable()
class ServiceFrequency {
  ServiceFrequency({
    this.lowestFrequency,
    this.highestFrequency,
  });

  int lowestFrequency;
  int highestFrequency;

  factory ServiceFrequency.fromJson(Map<String, dynamic> json) {
    return _$ServiceFrequencyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ServiceFrequencyToJson(this);
  }
}
