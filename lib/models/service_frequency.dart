import 'package:json_annotation/json_annotation.dart';

part 'service_frequency.g.dart';

@JsonSerializable()
class ServiceFrequency extends Object with _$ServiceFrequencySerializerMixin {
  ServiceFrequency({
    this.lowestFrequency,
    this.highestFrequency,
  });

  int lowestFrequency;
  int highestFrequency;

  factory ServiceFrequency.fromJson(Map<String, dynamic> json) {
    return _$ServiceFrequencyFromJson(json);
  }
}
