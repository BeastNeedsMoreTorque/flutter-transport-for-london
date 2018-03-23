// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_mode_group.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LineModeGroup _$LineModeGroupFromJson(Map<String, dynamic> json) =>
    new LineModeGroup(
        modeName: json['modeName'] as String,
        lineIdentifier: (json['lineIdentifier'] as List)
            ?.map((e) => e as String)
            ?.toList());

abstract class _$LineModeGroupSerializerMixin {
  String get modeName;
  List<String> get lineIdentifier;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'modeName': modeName, 'lineIdentifier': lineIdentifier};
}
