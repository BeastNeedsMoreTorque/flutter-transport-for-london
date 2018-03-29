// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twenty_four_hour_clock_time.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TwentyFourHourClockTime _$TwentyFourHourClockTimeFromJson(
        Map<String, dynamic> json) =>
    new TwentyFourHourClockTime(
        hour: json['hour'] as String, minute: json['minute'] as String);

abstract class _$TwentyFourHourClockTimeSerializerMixin {
  String get hour;
  String get minute;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'hour': hour, 'minute': minute};
}
