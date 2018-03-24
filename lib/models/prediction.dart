import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/prediction_timing.dart';

part 'prediction.g.dart';

@JsonSerializable()
class Prediction extends Object with _$PredictionSerializerMixin {
  Prediction({
    this.id,
    this.operationType,
    this.vehicleId,
    this.naptanId,
    this.stationName,
    this.lineId,
    this.lineName,
    this.platformName,
    this.direction,
    this.bearing,
    this.destinationNaptanId,
    this.destinationName,
    this.timestamp,
    this.timeToStation,
    this.currentLocation,
    this.towards,
    this.expectedArrival,
    this.timeToLive,
    this.modeName,
    this.timing,
  });

  String id;
  int operationType;
  String vehicleId;
  String naptanId;
  String stationName;
  String lineId;
  String lineName;
  String platformName;
  String direction;
  String bearing;
  String destinationNaptanId;
  String destinationName;
  DateTime timestamp;
  int timeToStation;
  String currentLocation;
  String towards;
  DateTime expectedArrival;
  DateTime timeToLive;
  String modeName;
  PredictionTiming timing;

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return _$PredictionFromJson(json);
  }
}
