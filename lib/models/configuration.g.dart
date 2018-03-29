// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    new Configuration(
        home: json['home'] == null
            ? null
            : new StopPoint.fromJson(json['home'] as Map<String, dynamic>),
        work: json['work'] == null
            ? null
            : new StopPoint.fromJson(json['work'] as Map<String, dynamic>));

abstract class _$ConfigurationSerializerMixin {
  StopPoint get home;
  StopPoint get work;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'home': home, 'work': work};
}
