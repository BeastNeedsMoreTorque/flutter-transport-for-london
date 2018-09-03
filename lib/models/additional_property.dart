import 'package:json_annotation/json_annotation.dart';

part 'additional_property.g.dart';

@JsonSerializable()
class AdditionalProperty {
  AdditionalProperty({
    this.category,
    this.key,
    this.sourceSystemKey,
    this.value,
  });

  String category;
  String key;
  String sourceSystemKey;
  String value;

  factory AdditionalProperty.fromJson(Map<String, dynamic> json) {
    return _$AdditionalPropertyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdditionalPropertyToJson(this);
  }
}
