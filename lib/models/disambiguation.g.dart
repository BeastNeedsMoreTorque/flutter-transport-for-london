// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disambiguation.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Disambiguation _$DisambiguationFromJson(Map<String, dynamic> json) =>
    new Disambiguation(
        disambiguationOptions: (json['disambiguationOptions'] as List)
            ?.map((e) => e == null
                ? null
                : new DisambiguationOption.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$DisambiguationSerializerMixin {
  List<DisambiguationOption> get disambiguationOptions;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'disambiguationOptions': disambiguationOptions};
}
