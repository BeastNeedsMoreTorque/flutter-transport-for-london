// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Mode _$ModeFromJson(Map<String, dynamic> json) => new Mode(
    isTflService: json['isTflService'] as bool,
    isFarePaying: json['isFarePaying'] as bool,
    isScheduledService: json['isScheduledService'] as bool,
    modeName: json['modeName'] as String);

abstract class _$ModeSerializerMixin {
  bool get isTflService;
  bool get isFarePaying;
  bool get isScheduledService;
  String get modeName;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'isTflService': isTflService,
        'isFarePaying': isFarePaying,
        'isScheduledService': isScheduledService,
        'modeName': modeName
      };
}
