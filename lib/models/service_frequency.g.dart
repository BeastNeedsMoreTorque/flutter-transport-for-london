// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_frequency.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ServiceFrequency _$ServiceFrequencyFromJson(Map<String, dynamic> json) =>
    new ServiceFrequency(
        lowestFrequency: json['lowestFrequency'] as int,
        highestFrequency: json['highestFrequency'] as int);

abstract class _$ServiceFrequencySerializerMixin {
  int get lowestFrequency;
  int get highestFrequency;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'lowestFrequency': lowestFrequency,
        'highestFrequency': highestFrequency
      };
}
