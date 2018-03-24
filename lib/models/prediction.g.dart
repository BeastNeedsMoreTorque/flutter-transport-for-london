// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Prediction _$PredictionFromJson(Map<String, dynamic> json) => new Prediction(
    id: json['id'] as String,
    operationType: json['operationType'] as int,
    vehicleId: json['vehicleId'] as String,
    naptanId: json['naptanId'] as String,
    stationName: json['stationName'] as String,
    lineId: json['lineId'] as String,
    lineName: json['lineName'] as String,
    platformName: json['platformName'] as String,
    direction: json['direction'] as String,
    bearing: json['bearing'] as String,
    destinationNaptanId: json['destinationNaptanId'] as String,
    destinationName: json['destinationName'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    timeToStation: json['timeToStation'] as int,
    currentLocation: json['currentLocation'] as String,
    towards: json['towards'] as String,
    expectedArrival: json['expectedArrival'] == null
        ? null
        : DateTime.parse(json['expectedArrival'] as String),
    timeToLive: json['timeToLive'] == null
        ? null
        : DateTime.parse(json['timeToLive'] as String),
    modeName: json['modeName'] as String,
    timing: json['timing'] == null
        ? null
        : new PredictionTiming.fromJson(
            json['timing'] as Map<String, dynamic>));

abstract class _$PredictionSerializerMixin {
  String get id;
  int get operationType;
  String get vehicleId;
  String get naptanId;
  String get stationName;
  String get lineId;
  String get lineName;
  String get platformName;
  String get direction;
  String get bearing;
  String get destinationNaptanId;
  String get destinationName;
  DateTime get timestamp;
  int get timeToStation;
  String get currentLocation;
  String get towards;
  DateTime get expectedArrival;
  DateTime get timeToLive;
  String get modeName;
  PredictionTiming get timing;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'operationType': operationType,
        'vehicleId': vehicleId,
        'naptanId': naptanId,
        'stationName': stationName,
        'lineId': lineId,
        'lineName': lineName,
        'platformName': platformName,
        'direction': direction,
        'bearing': bearing,
        'destinationNaptanId': destinationNaptanId,
        'destinationName': destinationName,
        'timestamp': timestamp?.toIso8601String(),
        'timeToStation': timeToStation,
        'currentLocation': currentLocation,
        'towards': towards,
        'expectedArrival': expectedArrival?.toIso8601String(),
        'timeToLive': timeToLive?.toIso8601String(),
        'modeName': modeName,
        'timing': timing
      };
}
