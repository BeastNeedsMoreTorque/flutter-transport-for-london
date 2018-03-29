// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disambiguation_option.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DisambiguationOption _$DisambiguationOptionFromJson(
        Map<String, dynamic> json) =>
    new DisambiguationOption(
        description: json['description'] as String, url: json['url'] as String);

abstract class _$DisambiguationOptionSerializerMixin {
  String get description;
  String get url;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'description': description, 'url': url};
}
