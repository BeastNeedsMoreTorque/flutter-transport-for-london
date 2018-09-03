import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/service_frequency.dart';
import 'package:transport_for_london/models/twenty_four_hour_clock_time.dart';

part 'period.g.dart';

@JsonSerializable()
class Period {
  Period({
    this.type,
    this.fromTime,
    this.toTime,
    this.frequency,
  });

  String type;
  TwentyFourHourClockTime fromTime;
  TwentyFourHourClockTime toTime;
  ServiceFrequency frequency;

  factory Period.fromJson(Map<String, dynamic> json) {
    return _$PeriodFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PeriodToJson(this);
  }
}
