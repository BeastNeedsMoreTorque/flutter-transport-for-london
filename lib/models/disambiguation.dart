import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/disambiguation_option.dart';

part 'disambiguation.g.dart';

@JsonSerializable()
class Disambiguation {
  Disambiguation({
    this.disambiguationOptions,
  });

  List<DisambiguationOption> disambiguationOptions;

  factory Disambiguation.fromJson(Map<String, dynamic> json) {
    return _$DisambiguationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DisambiguationToJson(this);
  }
}
