// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_response.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TimetableResponse _$TimetableResponseFromJson(Map<String, dynamic> json) =>
    new TimetableResponse(
        lineId: json['lineId'] as String,
        lineName: json['lineName'] as String,
        direction: json['direction'] as String,
        pdfUrl: json['pdfUrl'] as String,
        stations: (json['stations'] as List)
            ?.map((e) => e == null
                ? null
                : new MatchedStop.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        stops: (json['stops'] as List)
            ?.map((e) => e == null
                ? null
                : new MatchedStop.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        timetable: json['timetable'] == null
            ? null
            : new Timetable.fromJson(json['timetable'] as Map<String, dynamic>),
        disambiguation: json['disambiguation'] == null
            ? null
            : new Disambiguation.fromJson(
                json['disambiguation'] as Map<String, dynamic>));

abstract class _$TimetableResponseSerializerMixin {
  String get lineId;
  String get lineName;
  String get direction;
  String get pdfUrl;
  List<MatchedStop> get stations;
  List<MatchedStop> get stops;
  Timetable get timetable;
  Disambiguation get disambiguation;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'lineId': lineId,
        'lineName': lineName,
        'direction': direction,
        'pdfUrl': pdfUrl,
        'stations': stations,
        'stops': stops,
        'timetable': timetable,
        'disambiguation': disambiguation
      };
}
