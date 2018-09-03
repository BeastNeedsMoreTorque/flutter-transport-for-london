import 'package:json_annotation/json_annotation.dart';

part 'mode.g.dart';

@JsonSerializable()
class Mode {
  Mode({
    this.isTflService,
    this.isFarePaying,
    this.isScheduledService,
    this.modeName,
  });

  bool isTflService;
  bool isFarePaying;
  bool isScheduledService;
  String modeName;

  factory Mode.fromJson(Map<String, dynamic> json) {
    return _$ModeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ModeToJson(this);
  }
}
