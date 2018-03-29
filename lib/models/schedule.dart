import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/known_journey.dart';
import 'package:transport_for_london/models/period.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule extends Object with _$ScheduleSerializerMixin {
  Schedule({
    this.name,
    this.knownJourneys,
    this.firstJourney,
    this.lastJourney,
    this.periods,
  });

  String name;
  List<KnownJourney> knownJourneys;
  KnownJourney firstJourney;
  KnownJourney lastJourney;
  List<Period> periods;

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return _$ScheduleFromJson(json);
  }
}
