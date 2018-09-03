import 'package:json_annotation/json_annotation.dart';

part 'known_journey.g.dart';

@JsonSerializable()
class KnownJourney {
  KnownJourney({
    this.hour,
    this.minute,
    this.intervalId,
  });

  String hour;
  String minute;
  int intervalId;

  factory KnownJourney.fromJson(Map<String, dynamic> json) {
    return _$KnownJourneyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$KnownJourneyToJson(this);
  }
}
