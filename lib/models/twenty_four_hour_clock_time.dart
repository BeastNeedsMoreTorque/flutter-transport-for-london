import 'package:json_annotation/json_annotation.dart';

part 'twenty_four_hour_clock_time.g.dart';

@JsonSerializable()
class TwentyFourHourClockTime extends Object
    with _$TwentyFourHourClockTimeSerializerMixin {
  TwentyFourHourClockTime({
    this.hour,
    this.minute,
  });

  String hour;
  String minute;

  factory TwentyFourHourClockTime.fromJson(Map<String, dynamic> json) {
    return _$TwentyFourHourClockTimeFromJson(json);
  }
}
