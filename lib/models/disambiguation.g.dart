// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disambiguation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disambiguation _$DisambiguationFromJson(Map<String, dynamic> json) {
  return Disambiguation(
      disambiguationOptions: (json['disambiguationOptions'] as List)
          ?.map((e) => e == null
              ? null
              : DisambiguationOption.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DisambiguationToJson(Disambiguation instance) =>
    <String, dynamic>{'disambiguationOptions': instance.disambiguationOptions};
