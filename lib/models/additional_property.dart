import 'package:json_annotation/json_annotation.dart';

part 'additional_property.g.dart';

@JsonSerializable()
class AdditionalProperty extends Object with _$AdditionalPropertySerializerMixin {
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
}
