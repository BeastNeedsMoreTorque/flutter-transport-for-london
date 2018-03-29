// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'known_journey.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

KnownJourney _$KnownJourneyFromJson(Map<String, dynamic> json) =>
    new KnownJourney(
        hour: json['hour'] as String,
        minute: json['minute'] as String,
        intervalId: json['intervalId'] as int);

abstract class _$KnownJourneySerializerMixin {
  String get hour;
  String get minute;
  int get intervalId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'hour': hour,
        'minute': minute,
        'intervalId': intervalId
      };
}
