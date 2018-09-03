import 'package:json_annotation/json_annotation.dart';

part 'disambiguation_option.g.dart';

@JsonSerializable()
class DisambiguationOption {
  DisambiguationOption({
    this.description,
    this.url,
  });

  String description;
  String url;

  factory DisambiguationOption.fromJson(Map<String, dynamic> json) {
    return _$DisambiguationOptionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DisambiguationOptionToJson(this);
  }
}
