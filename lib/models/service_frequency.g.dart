// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_frequency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceFrequency _$ServiceFrequencyFromJson(Map<String, dynamic> json) {
  return ServiceFrequency(
      lowestFrequency: json['lowestFrequency'] as int,
      highestFrequency: json['highestFrequency'] as int);
}

Map<String, dynamic> _$ServiceFrequencyToJson(ServiceFrequency instance) =>
    <String, dynamic>{
      'lowestFrequency': instance.lowestFrequency,
      'highestFrequency': instance.highestFrequency
    };
